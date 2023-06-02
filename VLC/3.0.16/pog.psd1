@{
	Name = "VLC"
	Architecture = "x64"
	Version = "3.0.16"
	
	Install = @{
		Url = {"https://ftp.fau.de/videolan/vlc/$($this.Version)/win64/vlc-$($this.Version)-win64.7z"}
		Hash = "AF609A4B20BBE69B21D075077328DFCD188395A700151AA989C92EC840666570"
	}
	
	Enable = {
		Set-SymlinkedPath "./app/portable" "./data" Directory
		Assert-File "./data/vlcrc" {$this._DefaultVlcrc}

		Export-Command "vlc" "./app/vlc.exe"
		Export-Shortcut "VLC Player" "./app/vlc.exe"
	}

	# Disable update notifications and don't automatically download metadata
	_DefaultVlcrc = @"
[qt]
qt-updates-notif=0
qt-privacy-ask=0
"@
}
