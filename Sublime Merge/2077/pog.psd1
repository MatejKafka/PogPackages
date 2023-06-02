@{
	Name = 'Sublime Merge'
	Architecture = 'x64'
	Version = '2077'

	Install = @{
		Url = {$V = $this.Version; "https://download.sublimetext.com/sublime_merge_build_${V}_x64.zip"}
		Hash = "0988213E7C922A3B0634DBE90F235BEA90DC5DE7ADE6D7BC18525CCD3B57B768"
	}

	Enable = {
		Write-Warning "TODO: Disable autoupdate"

		Write-Warning "FIXME: have to force an absolute path for the ./app/Data symlink due to 'https://github.com/sublimehq/sublime_text/issues/5525'"
		Assert-Directory "./data"
		Set-SymlinkedPath "./app/Data" (Resolve-Path "./data") Directory
		
		Export-Command "smerge" "./app/smerge.exe"
		Export-Command "ssh-askpass-sublime" "./app/ssh-askpass-sublime.exe"
		Export-Shortcut "Sublime Merge" "./app/sublime_merge.exe"
	}
}
