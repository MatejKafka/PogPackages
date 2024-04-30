@{
	Name = 'Sublime Text'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {$V = $this.Version; "https://download.sublimetext.com/sublime_text_build_${V}_x64.zip"}
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Write-Warning "TODO: Disable autoupdate"

		if ([int]$this.Version -ge 4035) {
			New-Symlink "./app/Data" "./data" Directory
		} else {
			# have to force an absolute path for the ./app/Data symlink due to https://github.com/sublimehq/sublime_text/issues/5525
			New-Directory "./data"
			New-Symlink "./app/Data" (Resolve-Path "./data") Directory
		}

		Export-Command "subl" "./app/subl.exe"
		Export-Shortcut "Sublime Text" "./app/sublime_text.exe"
	}
}
