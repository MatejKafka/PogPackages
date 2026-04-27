@{
	Name = 'wifiqr'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://github.com/reugn/wifiqr'
	Description = 'Create a QR code with your Wi-Fi login details.'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "wifiqr" "./app/wifiqr.exe" -Symlink
	}
}