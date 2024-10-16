@{
	Name = "AutoHotkey v2"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		# TODO: deal with UI Access on normal machines
		Export-Command "AutoHotkey_v2" "./app/AutoHotkey64.exe" -Symlink
		Export-Shortcut "AutoHotkey v2" "./app/AutoHotkey64.exe"
		Export-Shortcut "WindowSpy (AutoHotkey v2)" "./app/AutoHotkey64.exe" -Arguments "./app/WindowSpy.ahk"
	}
}
