@{
	Name = "FileVoyager"
	Architecture = "x64"
	Version = "21.6.27.0"
	
	Install = @{
		Url = {"https://www.filevoyager.com/wp-content/uploads/FileVoyager_Portable_$($this.Version)_Full.7z"}
		Hash = "D5EB78C7EE68169ECB1F8C0B71827492D797A99EA1B69C90F9B85DA61B9DAFCF"
	}
	
	Enable = {
		Set-SymlinkedPath "./app/Ini" "./data" Directory
		Assert-File "./data/Portable.ini" {} {
			param($File)
			# make the file empty, otherwise it opens a Thank You page on first start
			if ((Get-Content -Raw $File) -ne "") {
				Set-Content $File "" -NoNewline
			}
		}
		# TODO: disable update checks even for existing FileVoyager.ini file
		Assert-File "./data/FileVoyager.ini" {$this._DefaultConfig}

		Export-Shortcut "FileVoyager" "./app/FileVoyager.exe"
	}

	_DefaultConfig = @"
[AutoUpdate]
Frequency=3
GetNewsRSS=0
"@
}