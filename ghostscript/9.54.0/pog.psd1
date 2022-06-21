@{
	Name = "ghostscript"
	Architecture = "x64"
	Version = "9.54.0"
	
	Install = @{
		Url = {
			$V = $this.Version -split "\." -join "" # semver version with dots removed
			"https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${V}/gs${V}w64.exe"
		}
		Hash = "55C5E6DCF467F05C0184FEE2333186EFB5EF12779095625345C8EA9862306B6E"
		NsisInstaller = $true
	}
	
	Enable = {
		Export-Command "gs" "./app/bin/gswin64c.exe" -NoSymlink
	}
}
