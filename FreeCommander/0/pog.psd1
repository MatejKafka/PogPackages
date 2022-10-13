@{
	Name = 'FreeCommander'
	Architecture = 'x64'
	Version = '0'

	Install = @{
		# unfortunately only a single unversioned URL
		Url = "https://freecommander.com/downloads/FreeCommanderXE-32-public_portable.zip"
	}

	Enable = {
		Assert-Directory "./data" {
			param($Dir)
			Copy-Item -Recurse "./app/Settings" $Dir
		}
		Assert-File "./app/fcStart.ini" -FixedContent {$this._fcStartIni}
		Assert-File "./data/Settings/FreeCommander.ini" -DefaultContent {$this._defaultConfig}

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
