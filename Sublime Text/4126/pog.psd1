@{
	Name = 'Sublime Text'
	Architecture = 'x64'
	Version = '4126'

	Install = @{
		Url = {$V = $this.Version; "https://download.sublimetext.com/sublime_text_build_${V}_x64.zip"}
		Hash = "0A27933A49A9DE6D9B8D3FD93A4A5EB80B5A4307C915F8E745BBB8350832E09C"
	}

	Enable = {
		Write-Warning "TODO: Disable autoupdate"

		Write-Warning "FIXME: have to force an absolute path for the ./app/Data symlink due to 'https://github.com/sublimehq/sublime_text/issues/5525'"
		Assert-Directory "./data"
		Set-SymlinkedPath "./app/Data" (Resolve-Path "./data") Directory
		
		Export-Command "subl" "./app/subl.exe"
		Export-Shortcut "Sublime Text" "./app/sublime_text.exe"
	}
}
