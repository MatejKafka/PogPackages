@{
	Name = 'Detect It Easy'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/horsicq/DIE-engine/releases/download/${V}/die_win64_portable_${V}_x64.zip"}
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