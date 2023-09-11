@{
	Name = "VS Code"
	Version = "{{TEMPLATE:Version}}"
	Architecture = "x64"

	# there's an update API at
	#  https://update.code.visualstudio.com/api/update/win32-x64-archive/stable/2af051012b66169dde0c4dfae3f5ef48f787ff69
	# but I couldn't figure out how to pull out the hash for a given version
	Install = @{
		Url = {"https://update.code.visualstudio.com/$($this.Version)/win32-x64-archive/stable"}
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./config"

		# ensure auto-update is disabled
		Assert-File "./config/settings.json" {'{"update.mode": "none"}'} {
			# VS Code JSON parser is quite liberal and accepts trailing commas, comments,...
			# therefore we cannot use ConvertFrom-Json to reliably parse the file
			$SettingsStr = cat -Raw $_
			$NewSettingsStr = $SettingsStr -replace '("update.mode"\s*:\s*)"([a-z][A-Z]+)"', '$1"none"'
			if ($NewSettingsStr -ne $SettingsStr) {
				Set-Content $_ $NewSettingsStr
			}
		}

		Set-SymlinkedPath "./data/user-data/User/keybindings.json" "./config/keybindings.json" File
		Set-SymlinkedPath "./data/user-data/User/settings.json" "./config/settings.json" File
		Set-SymlinkedPath "./data/user-data/logs" "./logs" Directory

		$Env = @{VSCODE_PORTABLE = "./data"}
		Export-Command "Code" "./app/Code.exe" -Environment $Env
		Export-Shortcut "Visual Studio Code (VS Code)" "./app/Code.exe" -Environment $Env
	}
}
