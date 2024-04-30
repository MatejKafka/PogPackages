@{
	Name = 'Audacity'
	Architecture = 'x64'
	Version = '3.4.2'

	Install = @{
		Url = "https://github.com/audacity/audacity/releases/download/Audacity-3.4.2/audacity-win-3.4.2-64bit.zip"
		Hash = "0DF85EDA8B79EBCCECA673A7F7DEC32C4FCB4625342B91995217F3124B57F7D4"
	}

	Enable = {
		# https://github.com/audacity/audacity/blob/51febec851647ccc2d5c0a96723d2532b7f4077c/libraries/lib-files/PathList.cpp#L144
		Write-Warning "Audacity always creates 'AppData/Local/Audacity', even though it does not write anything there."

		New-Directory "./cache"
		New-Symlink "./app/Portable Settings" "./data" Directory
		# TODO: updater
		New-File "./data/Audacity.cfg" $this._DefaultConfigSb

		Disable-DisplayScaling "./app/Audacity.exe"
		Export-Shortcut "Audacity" "./app/Audacity.exe"
	}

	_DefaultConfigSb = {@"
WantAssociateFiles=0
[Directories]
TempDir=$((Resolve-Path "./cache") -replace "\\", "\\")
[Update]
DefaultUpdatesChecking=0
"@}
}
