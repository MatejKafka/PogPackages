@{
	Name = "Alacritty"
	Architecture = "x64"

	Version = "0.10.1"
	_Hash = "9DFC25B2C41275B88F0DE24591139F62D9D5E8EAD5A3E07E6442F75B446F7C5E"
	
	Install = {
		$V = $this.Version
		$Url = "https://github.com/alacritty/alacritty/releases/download/v${V}/Alacritty-v${V}-portable.exe"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NoArchive

		# name of the executable contains the version; it would be non-trivial to find
		#  the file name in the wrapper, so we rename it
		Rename-Item ./app/* "Alacritty.exe"
	}
	
	Enable = {
		Assert-File "./config/alacritty.yml"

		Export-Shortcut "Alacritty" "$ManifestRoot/Alacritty_wrapper.cmd" -Icon "./app/Alacritty.exe"
	}
}
