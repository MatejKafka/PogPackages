@{
	Name = "VS Code"
	Version = "1.71.1"
	Architecture = "x64"

	# there's an update API at
	#  https://update.code.visualstudio.com/api/update/win32-x64-archive/stable/2af051012b66169dde0c4dfae3f5ef48f787ff69
	# but I couldn't figure out how to pull out the hash for a given version

	Install = @{
		Url = {"https://update.code.visualstudio.com/$($this.Version)/win32-x64-archive/stable"}
		Hash = "E6CFFFBDA70F36456C7478AA4E9F533372AF7657869B7B0D0FC8BF8E56E82ADC"
	}

	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./config"

		# ensure auto-update is disabled
		Assert-File "./data/user-data/User/settings.json" {'{"update.mode": "none"}'} {
			param($File)
			$settings = Get-Content -Raw $File | ConvertFrom-Json -AsHashtable
			if ($settings.ContainsKey("update.mode") -and $settings."update.mode" -eq "none") {
				return $false
			}
			$settings."update.mode" = "none"
			ConvertTo-Json -Depth 64 $settings | Out-File $File
			return $true
		}

		Set-SymlinkedPath "./data/user-data/User/keybindings.json" "./config/keybindings.json" File
		Set-SymlinkedPath "./data/user-data/User/settings.json" "./config/settings.json" File
		Set-SymlinkedPath "./data/user-data/logs" "./logs" Directory

		Export-Command "Code" "./.pog/vscode_wrapper_command.cmd"
		Export-Shortcut "Visual Studio Code (VS Code)" "./.pog/vscode_wrapper.cmd" -IconPath "./app/Code.exe"
	}
}
