@{
	Name = 'dark@ScoopInstaller'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {"https://raw.githubusercontent.com/ScoopInstaller/Binary/master/dark/dark-$($this.Version).zip"}
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "dark" "./app/dark.exe"
	}
}