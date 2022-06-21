@{
	Name = "Alacritty"
	Architecture = "x64"
	Version = "0.10.0"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/alacritty/alacritty/releases/download/v${V}/Alacritty-v${V}-portable.exe"}
		Hash = "6253CC8B39C784F0369AB6E307A49C473EB81863DF4EC7882ECFB6D7630A8811"
		NoArchive = $true
		SetupScript = {
			param($AppDir)
			# name of the executable contains the version; it would be non-trivial to find the file name in the wrapper, so we rename it
			Rename-Item $AppDir/* "Alacritty.exe"
		}
	}
	
	Enable = {
		Assert-File "./config/alacritty.yml"

		Export-Shortcut "Alacritty" "./.pog/Alacritty_wrapper.cmd" -Icon "./app/Alacritty.exe"
	}
}
