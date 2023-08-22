@{
	Name = 'Sublime Merge'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {$V = $this.Version; "https://download.sublimetext.com/sublime_merge_build_${V}_x64.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		Write-Warning "TODO: Disable autoupdate"

		if ([int]$this.Version -ge 2079) {
			Set-SymlinkedPath "./app/Data" "./data" Directory
		} else {
			# have to force an absolute path for the ./app/Data symlink due to https://github.com/sublimehq/sublime_text/issues/5525
			Assert-Directory "./data"
			Set-SymlinkedPath "./app/Data" (Resolve-Path "./data") Directory
		}

		Export-Command "smerge" "./app/smerge.exe"
		Export-Command "ssh-askpass-sublime" "./app/ssh-askpass-sublime.exe"
		Export-Shortcut "Sublime Merge" "./app/sublime_merge.exe"
	}
}
