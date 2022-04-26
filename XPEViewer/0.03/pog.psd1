@{
	Name = "XPEViewer"
	Architecture = "x64"
	Version = "0.03"
	
	Install = @{
		Url = {$v = $this.Version; "https://github.com/horsicq/XPEViewer/releases/download/${V}/xpeviewer_win64_portable_${V}.zip"}
		Hash = "B956BFF4CF02F2E21D551B9E0720E23C670DCF27AFF86F680667FA54B3F562F0"
	}
	
	Enable = {
		Set-SymlinkedPath "./app/xpeviewer.ini" "./config/xpeviewer.ini" File

		Export-Shortcut "XPEViewer" "./app/xpeviewer.exe"
	}
}
