@{
	Name = 'Lapce'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://lapce.dev'
	Description = 'Lightning-fast and powerful code editor written in Rust.'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Symlink "./app/lapce-data/data" "./data" Directory
		New-Symlink "./app/lapce-data/config" "./config" Directory

		Export-Command "lapce" "./app/lapce.exe"
		Export-Shortcut "Lapce" "./app/lapce.exe"
	}
}