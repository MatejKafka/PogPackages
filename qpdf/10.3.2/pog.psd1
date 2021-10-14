@{
	Name = "qpdf"
	Architecture = "x64"
	
	Version = "10.3.2"
	_Hash = "518846458c6b0fbd57e91543f4dc9342015d1d1ca3532c23faa54d64a67e650b"
	
	Install = {
		$Url = "https://github.com/qpdf/qpdf/releases/download/release-qpdf-$($this.Version)/qpdf-$($this.Version)-bin-msvc64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Export-Command "qpdf" "./app/bin/qpdf.exe" -NoSymlink
		Export-Command "fix-qdf" "./app/bin/fix-qdf.exe" -NoSymlink
	}
}