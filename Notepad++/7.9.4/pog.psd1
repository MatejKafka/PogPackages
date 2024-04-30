@{
	Name = "Notepad++"
	Version = "7.9.4"
	Architecture = "x64"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v${V}/npp.${V}.portable.x64.zip"}
		Hash = "DF4E364873A8097FEF716D4303D294BF5A71821FE10025A6505FCEC968FA9C4D"
	}

	Enable = {
		New-Directory "./config"
		New-Directory "./cache"

		# this makes npp store its config in the provided directory
		New-File "./app/cloud/choice" -FixedContent ([string](Resolve-Path "./config"))

		New-Symlink "./config/backup" "./cache/backup" Directory
		New-Symlink "./app/plugins/Config" "./config/plugins" Directory -Merge
		New-Symlink "./app/session.xml" "./config/session.xml" File

		& .\.pog\UpdateThemePath.ps1

		Export-Command "notepad++" "./app/notepad++.exe"
		Export-Shortcut "Notepad++" "./app/notepad++.exe"
	}
}

