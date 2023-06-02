@{
	Name = "AutoHotkey v2"
	Architecture = "x64"
	Version = "2.0-beta.3"
	
	Install = @{
		Url = {"https://www.autohotkey.com/download/2.0/AutoHotkey_$($this.Version).zip"}
		Hash = "8F646A06D9B7E84B5F9195A3F114781E036965C216A6CC3E66CEF1F83BC660B0"
	}
	
	Enable = {
		# TODO: deal with UI Access on normal machines
		Export-Command "AutoHotkey_v2" "./app/AutoHotkey64.exe" -Symlink
		Export-Shortcut "AutoHotkey v2" "./app/AutoHotkey64.exe"
	}
}
