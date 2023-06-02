@{
	Name = "qpdf"
	Architecture = "x64"
	Version = "10.3.2"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/qpdf/qpdf/releases/download/release-qpdf-${V}/qpdf-${V}-bin-msvc64.zip"}
		Hash = "518846458c6b0fbd57e91543f4dc9342015d1d1ca3532c23faa54d64a67e650b"
	}
	
	Enable = {
		Export-Command "qpdf" "./app/bin/qpdf.exe"
		Export-Command "fix-qdf" "./app/bin/fix-qdf.exe"
	}
}
