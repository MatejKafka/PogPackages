@{
	Name = "MobaXterm"
	Version = "20.3.0"
	Architecture = "x86"
	
	Install = @{
		Url = "https://download.mobatek.net/2032020060430358/MobaXterm_Portable_v20.3.zip"
		Hash = "5C4C6F3098C3E802657B27FF4E56EDA8AF7D33830450BE8D3C950D3469388439"
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-File "./config/MobaXterm.ini"
		
		Export-Shortcut "MobaXterm" "./app/MobaXterm_Personal_20.3.exe" -Arguments @("-i", "./config/MobaXterm.ini")
	}
}
