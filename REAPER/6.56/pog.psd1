@{
	Name = "REAPER"
	Architecture = "x64"
	Version = "6.56"

	Install = @{
		Url = "https://www.reaper.fm/files/6.x/reaper656_x64-install.exe"
		Hash = "1EAC4B8D53FD40CBB5A439285360A66BD07531635B7F15511AEE7020C15AD91A"
		SetupScript = {
			ls './$INSTDIR$_8_' | mv -Destination .
			rm -Recurse './$COMMONFILES64', './$PLUGINSDIR', './$INSTDIR$_8_', './Uninstall.exe'
		}
	}

	Enable = {
		New-Directory "./config"

		New-File "./config/reaper.ini" {
			"[REAPER]"
			"wnd_state=0"
			""
		}

		$ConfigFiles = @("reaper-install-rev.txt", "reaper-fxtags.ini", "reaper-install.ini", "reaper-midihw.ini",
				"reaper-mouse.ini", "reaper-reginfo2.ini", "reaper-vstplugins64.ini", "reaper.ini")
		$ConfigFiles | % {
			New-Symlink "./app/$_" "./config/$_" File
		}

		Export-Shortcut "REAPER" "./app/reaper.exe"
		Export-Shortcut "ReaMote (REAPER)" "./app/reamote.exe"
	}
}
