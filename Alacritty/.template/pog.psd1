@{
	Name = "Alacritty"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @(
		@{
			Url = "{{TEMPLATE:ExeUrl}}"
			Hash = "{{TEMPLATE:ExeHash}}"
			NoArchive = $true
			Target = "Alacritty.exe"
		}
		@{
			Url = "{{TEMPLATE:ConfigUrl}}"
			Hash = "{{TEMPLATE:ConfigHash}}"
			NoArchive = $true
			Target = "alacritty-default.yml"
		}
	)

	Enable = {
		# if config file does not exist, use the default one
		New-File "./config/alacritty.yml" "./app/alacritty-default.yml"

		Export-Shortcut "Alacritty" "./app/Alacritty.exe" `
			-Arguments @("--config-file", "./config/alacritty.yml") `
			-VcRedist
	}
}