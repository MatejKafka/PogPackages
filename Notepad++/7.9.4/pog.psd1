@{
	Name = "Notepad++"
	Version = "7.9.4"
	Architecture = "x64"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v${V}/npp.${V}.portable.x64.zip"}
		Hash = "DF4E364873A8097FEF716D4303D294BF5A71821FE10025A6505FCEC968FA9C4D"
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"

		# this makes npp store its config in the provided directory
		$ConfigPath = [string](Resolve-Path "./config")
		Assert-File "./app/cloud/choice" {$ConfigPath} {
			param($File)
			if ($ConfigPath -eq (Get-Content -Raw $File)) {return $false}
			$ConfigPath | Set-Content $File -NoNewline
			return $true
		}

		Set-SymlinkedPath "./config/backup" "./cache/backup" Directory
		Set-SymlinkedPath "./app/plugins/Config" "./config/plugins" Directory -Merge
		Set-SymlinkedPath "./app/session.xml" "./config/session.xml" File

		& .\.pog\UpdateThemePath.ps1

		Disable-DisplayScaling "./app/notepad++.exe"
		Export-Shortcut "Notepad++" "./app/notepad++.exe"
		Export-Command "notepad++" "./app/notepad++.exe" -NoSymlink
	}
}

