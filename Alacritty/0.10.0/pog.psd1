@{
	Name = "Alacritty"
	Architecture = "x64"
	Version = "0.10.0"
	
	Install = @(
		@{
			Url = {$V = $this.Version; "https://github.com/alacritty/alacritty/releases/download/v${V}/Alacritty-v${V}-portable.exe"}
			Hash = "6253CC8B39C784F0369AB6E307A49C473EB81863DF4EC7882ECFB6D7630A8811"
			NoArchive = $true
			Target = "Alacritty.exe"
		}
		@{
			Url = {$V = $this.Version; "https://github.com/alacritty/alacritty/releases/download/v${V}/alacritty.yml"}
			Hash = "C7C2F96113F3C2CDF0EF059CDED558CC5746B3BE60C6FEF3B7040A3B8325C686"
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