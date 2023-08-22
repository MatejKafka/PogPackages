@{
	Name = 'cURL'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {$V = $this.Version; "https://curl.se/windows/dl-${V}/curl-${V}-win64-mingw.zip"}
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command curl "./app/bin/curl.exe" -Symlink
	}
}
