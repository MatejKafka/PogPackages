@{
	Name = "MultiMC"
	Architecture = "x86"
	Version = "0.7.0"
	
	Install = @{
		# 0.7.0 is perpetually updated, the hash changes: https://multimc.org/posts/0-7-0-update.html
		Url = "https://files.multimc.org/downloads/mmc-develop-win32.zip"
	}
	
	Enable = {
		Assert-Directory "./data"
		
		Export-Shortcut "MultiMC" "./app/MultiMC.exe" -Arguments @("--dir", "./data")
	}
}
