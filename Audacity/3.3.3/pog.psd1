@{
	Name = 'Audacity'
	Architecture = 'x64'
	Version = '3.3.3'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/audacity/audacity/releases/download/Audacity-${V}/audacity-win-${V}-x64.zip"}
		Hash = "3060F6A46B4EAF23816826037FB05934812199F19944162E9D9BA03BA5D8CC4A"
	}

	Enable = {
		# https://github.com/audacity/audacity/blob/51febec851647ccc2d5c0a96723d2532b7f4077c/libraries/lib-files/PathList.cpp#L144
		Write-Warning "Audacity always creates 'AppData/Local/Audacity', even though it does not write anything there."

		Assert-Directory "./cache"
		Set-SymlinkedPath "./app/Portable Settings" "./data" Directory
		# TODO: updater
		Assert-File "./data/Audacity.cfg" $this._DefaultConfigSb

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
