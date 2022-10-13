@{
	Name = "Alacritty"
	Architecture = "x64"
	Version = "0.10.1"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/alacritty/alacritty/releases/download/v${V}/Alacritty-v${V}-portable.exe"}
		Hash = "9DFC25B2C41275B88F0DE24591139F62D9D5E8EAD5A3E07E6442F75B446F7C5E"
		NoArchive = $true
		SetupScript = {
			# name of the executable contains the version; it would be non-trivial to find the file name in the wrapper, so we rename it
			Rename-Item ./* "Alacritty.exe"
		}
	}
	
	Enable = {
		# TODO: when multiple sources are implemented, also download the default config file from the Release page
		Assert-File "./config/alacritty.yml"

		Export-Shortcut "Alacritty" "./.pog/Alacritty_wrapper.cmd" -Icon "./app/Alacritty.exe"
	}
}
