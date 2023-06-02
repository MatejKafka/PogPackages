@{
	Name = "AutoHotkey v2"
	Architecture = "x64"
	Version = "2.0-beta.1"
	
	Install = @{
		Url = {"https://www.autohotkey.com/download/2.0/AutoHotkey_$($this.Version).zip"}
		Hash = "93C9FA6807DAD1B0592A19FC180EB33B2932DC372582E59089928FD7B9161DC9"
	}
	
	Enable = {
		# TODO: deal with UI Access on normal machines
		Export-Command "AutoHotkey_v2" "./app/AutoHotkey64.exe" -Symlink
		Export-Shortcut "AutoHotkey v2" "./app/AutoHotkey64.exe"
	}
}
