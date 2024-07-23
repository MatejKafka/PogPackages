@{
	Name = 'python-embeddable'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		$v = $this.Version -split "\."
		$MinorVer = $v[0] + "." + $v[1]

		Export-Command "python" "./app/python.exe"
		Export-Command "python3" "./app/python.exe"
		Export-Command ("python" + $MinorVer) "./app/python.exe"

		Export-Command "pythonw" "./app/pythonw.exe"
		Export-Command "pythonw3" "./app/pythonw.exe"
		Export-Command ("pythonw" + $MinorVer) "./app/pythonw.exe"
	}
}