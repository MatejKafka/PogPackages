@{
	Name = "VS Code"
	Version = "1.49.3"
	Architecture = "x64"
	
	# there's an update API at
	#  https://update.code.visualstudio.com/api/update/win32-x64-archive/stable/2af051012b66169dde0c4dfae3f5ef48f787ff69
	# but I couldn't figure out how to pull out the hash for a given version
	# TODO: check hash
	
	Install = @{
		Url = {"https://update.code.visualstudio.com/$($this.Version)/win32-x64-archive/stable"}
		Hash = "C16E589C60BC4FC33113C14D8D1B46E8E26A23716BD7ED3DBE6A38C9D435EE04"
	}

	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./config"
		Assert-Directory "./logs"
		
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
		
		Set-SymlinkedPath "./data/user-data/User/keybindings.json" "./config/keybindings.json"
		Set-SymlinkedPath "./data/user-data/User/settings.json" "./config/settings.json"
		
		Export-Shortcut "Visual Studio Code (VS Code)" "./.manifest/vscode_wrapper.cmd" -IconPath "./app/Code.exe"
	}
}
