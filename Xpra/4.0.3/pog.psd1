@{
	Name = "Xpra"
	Version = "4.0.3"
	Architecture = "x64"
	
	Install = @{
		Url = "http://xpra.org/dists/windows/Xpra-Client-Python3-x86_64_4.0.3-r27086.zip"
		Hash = "ECB97E10DFF23FD0B73C2E57A3DC520B673498A6DCBC76F43E70408CFFEAFF17"
	}
	
	Enable = {
		Assert-Directory .\config
		Assert-Directory .\logs
		
		Export-Shortcut "Xpra" "./.pog/xpra_shortcut.cmd" -IconPath "./app/Xpra.exe"
		Export-Command "xpra" "./.pog/xpra_cmd.cmd"
		Export-Command "xpra-launcher" "./.pog/xpra_launcher.cmd"
	}
}
