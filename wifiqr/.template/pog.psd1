@{
	Name = 'wifiqr'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/reugn/wifiqr/releases/download/v${V}/wifiqr_${V}_windows_x86_64.zip"}
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "wifiqr" "./app/wifiqr.exe" -Symlink
	}
}