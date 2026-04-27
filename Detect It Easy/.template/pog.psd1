@{
	Name = 'Detect It Easy'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://github.com/horsicq/Detect-It-Easy'
	Description = 'Program for determining types of files.'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Directory "./config"
		New-Symlink "./app/die.ini" "./config/die.ini" File
		New-Symlink "./app/diel.ini" "./config/diel.ini" File
		New-Symlink "./app/shortcuts.ini" "./config/shortcuts.ini" File

		Export-Command "diec" "./app/diec.exe"
		Export-Command "die" "./app/die.exe"
		Export-Command "diel" "./app/diel.exe"

		Export-Shortcut "Detect It Easy" "./app/die.exe"
		Export-Shortcut "Detect It Easy (Lite)" "./app/diel.exe"
	}
}