@{
	Name = "AutoHotkey v2"
	Architecture = "x64"
	Version = "2.0-beta.2"
	
	Install = @{
		Url = {"https://www.autohotkey.com/download/2.0/AutoHotkey_$($this.Version).zip"}
		Hash = "68099B4217955C5D85517803A89C9F9A3F5C3506B410E5B444E105AE1B7C3465"
	}
	
	Enable = {
		# TODO: deal with UI Access on normal machines
		Export-Command "AutoHotkey_v2" "./app/AutoHotkey64.exe" -Symlink
		Export-Shortcut "AutoHotkey v2" "./app/AutoHotkey64.exe"
	}
}
