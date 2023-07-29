@{
	Name = "Alacritty"
	Architecture = "x64"
	Version = "0.10.1"
	
	Install = @(
		@{
			Url = {$V = $this.Version; "https://github.com/alacritty/alacritty/releases/download/v${V}/Alacritty-v${V}-portable.exe"}
			Hash = "9DFC25B2C41275B88F0DE24591139F62D9D5E8EAD5A3E07E6442F75B446F7C5E"
			NoArchive = $true
			Target = "Alacritty.exe"
		}
		@{
			Url = {$V = $this.Version; "https://github.com/alacritty/alacritty/releases/download/v${V}/alacritty.yml"}
			Hash = "EFBCC21E0971BE33CEAFCFA5CA3E240D444DEDDEE9B3B851DC8BCC3F1D2213E3"
			NoArchive = $true
			Target = "alacritty-default.yml"
		}
	)
	
	Enable = {
		# if config file does not exist, use the default one
		Assert-File "./config/alacritty.yml" "./app/alacritty-default.yml"

		Export-Shortcut "Alacritty" "./app/Alacritty.exe" `
			-Arguments @("--config-file", (Resolve-Path "./config/alacritty.yml"))
	}
}