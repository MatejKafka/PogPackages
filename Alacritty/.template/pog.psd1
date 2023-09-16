@{
	Name = "Alacritty"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @(
		@{
			Url = {$V = $this.Version; "https://github.com/alacritty/alacritty/releases/download/v${V}/Alacritty-v${V}-portable.exe"}
			Hash = "{{TEMPLATE:HashExe}}"
			NoArchive = $true
			Target = "Alacritty.exe"
		}
		@{
			Url = {$V = $this.Version; "https://github.com/alacritty/alacritty/releases/download/v${V}/alacritty.yml"}
			Hash = "{{TEMPLATE:HashYml}}"
			NoArchive = $true
			Target = "alacritty-default.yml"
		}
	)
	
	Enable = {
		# if config file does not exist, use the default one
		Assert-File "./config/alacritty.yml" "./app/alacritty-default.yml"

		Export-Shortcut "Alacritty" "./app/Alacritty.exe" `
			-Arguments @("--config-file", "./config/alacritty.yml") `
			-VcRedist
	}
}