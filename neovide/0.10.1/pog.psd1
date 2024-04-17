@{
	Name = 'neovide'
	Architecture = 'x64'
	Version = '0.10.1'

	Install = @{
		Url = {"https://github.com/neovide/neovide/releases/download/$($this.Version)/neovide-windows.zip"}
		Hash = "944E75545F8FAE08AE42FDB0D2073F699C7ED209EC02B2BEDF062377C0929456"
	}

	Enable = {
		Export-Shortcut "Neovide" "./app/neovide.exe" -VcRedist
	}
}
