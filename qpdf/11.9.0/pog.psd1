@{
	Name = "qpdf"
	Architecture = "x64"
	Version = "11.9.0"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/qpdf/qpdf/releases/download/v${V}/qpdf-${V}-msvc64.zip"}
		Hash = "3AABC88796174FEB96EB8C909805EB71CCCB498C17AC865E4B4F122C52E33430"
	}
	
	Enable = {
		Export-Command "qpdf" "./app/bin/qpdf.exe"
		Export-Command "fix-qdf" "./app/bin/fix-qdf.exe"
	}
}
