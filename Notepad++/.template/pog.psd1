@{
	Name = "Notepad++"
	Architecture = "x64"
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
		SetupScript = {
			# remove updater; npp does not seem to mind and it makes sure that it won't autoupdate
			rm "./updater" -Recurse
		}
	}

	Enable = {
		New-Directory "./config"
		New-Directory "./cache"

		# this makes npp store its config in the provided directory
		New-File "./app/cloud/choice" -FixedContent ([string](Resolve-Path "./config"))
		New-File "./config/config.xml" -DefaultContent "./app/config.xml" -ContentUpdater $this._FixConfig

		New-Symlink "./config/backup" "./cache/backup" Directory
		New-Symlink "./app/plugins/Config" "./config/plugins" Directory -Merge
		New-Symlink "./app/session.xml" "./config/session.xml" File

		Export-Command "notepad++" "./app/notepad++.exe"
		Export-Shortcut "Notepad++" "./app/notepad++.exe"
	}

	# fix theme path; this is only necessary for older versions of npp; in newer versions, the key was renamed to "DarkMode"
	# and uses just the names instead of relative paths, so this (correctly) does not do anything
	_FixConfig = {
		param($ConfigFile)

		$Config = [xml](Get-Content -Raw $ConfigFile)

		$ChangedTheme = $Config.NotepadPlus.GUIConfigs.GuiConfig | ? {$_.Name -eq "stylerTheme"} | % {
			if (Test-Path $_.path) {
				Write-Verbose "Theme path is valid."
				return
			}

			$ThemeName = Split-Path -Leaf $_.path
			if ($ThemeName -eq "stylers.xml") {
				$ThemePath = Resolve-Path ("./config/stylers.xml")
			} else {
				try {
					$ThemePath = Resolve-Path ("./app/themes/" + $ThemeName)
				} catch {
					throw "Could not fix theme path in '$ConfigFile' - unknown theme name: '$ThemeName'."
				}
			}
			$OldPath = $_.path
			$_.path = [String]$ThemePath
			Write-Information "Fixed theme path from '$OldPath' to '$ThemePath'."
			$true
		}

		if ($ChangedTheme) {
			$Config.Save($ConfigFile)
		}
	}
}
