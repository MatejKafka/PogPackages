@{
	Name = 'PE-sieve'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {"https://github.com/hasherezade/pe-sieve/releases/download/v$($this.Version)/pe-sieve64.zip"}
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "pe-sieve" "./app/pe-sieve.exe" -Symlink
	}
}