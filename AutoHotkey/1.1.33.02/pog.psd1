@{
	Name = "AutoHotkey"
	Architecture = @("x64", "x86")
	Version = "1.1.33.02"
	
	Install = @{
		Url = {"https://www.autohotkey.com/download/1.1/AutoHotkey_$($this.Version).zip"}
		Hash = "8A78C784D590737431167F35667FA6580F88B543AEDE43B13F64A1A23780BF22"
	}
	
	Enable = {
		# TODO: deal with UI Access on normal machines
		if ([Environment]::Is64BitOperatingSystem) {
			Export-Command "AutoHotkey" "./app/AutoHotkeyU64.exe"
			Export-Shortcut "AutoHotkey" "./app/AutoHotkeyU64.exe"
		} else {
			Export-Command "AutoHotkey" "./app/AutoHotkeyU32.exe"
			Export-Shortcut "AutoHotkey" "./app/AutoHotkeyU32.exe"
		}
		Export-Command "Ahk2Exe" "./app/Compiler/Ahk2Exe.exe" -NoSymlink
	}
}

