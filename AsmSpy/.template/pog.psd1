@{
	Name = 'AsmSpy'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
		Subdirectory = "tools"
	}

	Enable = {
		Export-Command "AsmSpy" "./app/AsmSpy.exe" -Symlink
	}
}