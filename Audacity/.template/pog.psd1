@{
	Name = 'Audacity'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
		# archive for 3.7.0 includes a random __MACOSX dir
		Subdirectory = 'Audacity-*'
	}

	Enable = {
		# https://github.com/audacity/audacity/blob/51febec851647ccc2d5c0a96723d2532b7f4077c/libraries/lib-files/PathList.cpp#L144
		Write-Warning "Audacity always creates 'AppData/Local/Audacity', even though it does not write anything there."

		New-Directory "./cache"
		New-Symlink "./app/Portable Settings" "./data" Directory
		# TODO: updater
		New-File "./data/Audacity.cfg" $this._DefaultConfigSb

		$Audacity4 = [Pog.PackageVersion]$this.Version -ge "4.0.0"
		$BinPath = if ($Audacity4) {"./app/bin/Audacity4.exe"} else {"./app/Audacity.exe"}
		if (-not $Audacity4) {
			Disable-DisplayScaling "./app/Audacity.exe"
		}
		Export-Shortcut "Audacity" $BinPath
	}

	_DefaultConfigSb = {@"
WantAssociateFiles=0
[Directories]
TempDir=$((Resolve-Path "./cache") -replace "\\", "\\")
[Update]
DefaultUpdatesChecking=0
"@}
}
