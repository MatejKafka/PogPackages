@{
	Name = 'PE-sieve'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://github.com/hasherezade/pe-sieve'
	Description = 'Scans a given process, recognizes and dumps a variety of potentially malicious implants.'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "pe-sieve" "./app/pe-sieve.exe" -Symlink
	}
}