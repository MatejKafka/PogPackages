@{
	Name = "ghostscript"
	Architecture = "x64"
	
	Version = "9.54.0"
	_Hash = "55C5E6DCF467F05C0184FEE2333186EFB5EF12779095625345C8EA9862306B6E"
	
	Install = {
		# semver version with dots removed
		$V = $this.Version -split "\." -join ""
		$Url = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${V}/gs${V}w64.exe"
		Install-FromUrl $Url -ExpectedHash $this._Hash -Nsis
	}
	
	Enable = {
		Export-Command "gs" "./app/bin/gswin64c.exe" -NoSymlink
	}
}