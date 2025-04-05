@{
	Name = 'ILRepack'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = "https://github.com/gluck/il-repack"

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
		Subdirectory = "tools"
	}

	Enable = {
		Export-Command "ILRepack" "./app/ILRepack.exe" -Symlink
	}
}