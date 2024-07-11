@{
	Name = 'GoReSym'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {"https://github.com/mandiant/GoReSym/releases/download/v$($this.Version)/GoReSym-windows.zip"}
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "GoReSym" "./app/GoReSym.exe" -Symlink
	}
}