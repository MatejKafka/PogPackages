@{
	Name = 'carapace@rsteube'
	Architecture = 'x64'
	Version = '0.24.4'

	Install = @{
		Url = {"https://github.com/rsteube/carapace-bin/releases/download/v$($this.Version)/carapace-bin_windows_amd64.zip"}
		Hash = "A4B9F462062A134B0A68CAF5763EE0E788CB32BA4DB6A1EE65618AE573365B7D"
	}

	Enable = {
		New-Directory "./data"
		New-Directory "./cache"

		Export-Command "carapace" "./app/carapace.exe" -Environment @{
			APPDATA = "./data"
			LOCALAPPDATA = "./cache"
		}
	}
}
