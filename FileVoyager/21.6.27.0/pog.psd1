@{
	Name = "FileVoyager"
	Architecture = "x64"
	Version = "21.6.27.0"

	Install = @{
		Url = {"https://www.filevoyager.com/wp-content/uploads/FileVoyager_Portable_$($this.Version)_Full.7z"}
		Hash = "D5EB78C7EE68169ECB1F8C0B71827492D797A99EA1B69C90F9B85DA61B9DAFCF"
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
