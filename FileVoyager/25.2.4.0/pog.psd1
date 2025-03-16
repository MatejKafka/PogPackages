@{
	Name = "FileVoyager"
	Architecture = "x64"
	Version = "25.2.4.0"

	Install = @{
		Url = {"https://www.filevoyager.com/wp-content/uploads/FileVoyager_Portable_$($this.Version)_Full.7z"}
		Hash = "D6DD8DB57A2AA0453F9B9C6ECFAF95B501120FCB0CC3485848528A2114A02D74"
	}

	Enable = {
		New-Symlink "./app/Ini" "./data" Directory

		# make the file empty, otherwise it opens a Thank You page on first start
		New-File "./data/Portable.ini" -FixedContent ""
		# TODO: disable update checks even for existing FileVoyager.ini file
		New-File "./data/FileVoyager.ini" {$this._DefaultConfig}

		Export-Shortcut "FileVoyager" "./app/FileVoyager.exe"
	}

	_DefaultConfig = @"
[AutoUpdate]
Frequency=3
GetNewsRSS=0
"@
}
