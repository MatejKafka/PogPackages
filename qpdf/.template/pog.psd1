@{
	Name = "qpdf"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Export-Command "qpdf" "./app/bin/qpdf.exe"
		Export-Command "fix-qdf" "./app/bin/fix-qdf.exe"
	}
}
