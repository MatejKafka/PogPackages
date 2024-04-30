@{
	Name = 'FreeCommander'
	Architecture = 'x64'
	Version = '0'

	Install = @{
		# unfortunately only a single unversioned URL
		Url = "https://freecommander.com/downloads/FreeCommanderXE-32-public_portable.zip"
	}

	Enable = {
		New-Directory "./data" {
			param($Dir)
			Copy-Item -Recurse "./app/Settings" $Dir
		}
		New-File "./app/fcStart.ini" -FixedContent $this._fcStartIni
		New-File "./data/Settings/FreeCommander.ini" -DefaultContent {$this._defaultConfig}

		Export-Shortcut "FreeCommander" "./app/FreeCommander.exe"
	}

	_fcStartIni = @"
[Start]
freeCommanderIniDir=%FcSrcPath%\..\data

"@

	_defaultConfig = @"
[Form]
CheckForUpdateCycle=0

"@
}
