@{
	Name = 'Sublime Text'
	Architecture = 'x64'
	Version = '4143'

	Install = @{
		Url = {$V = $this.Version; "https://download.sublimetext.com/sublime_text_build_${V}_x64.zip"}
		Hash = "889E7D6D0DE115DEEFBB8D48AF5E754F7566100D8A6615902DA64798CD663CAC"
	}

	Enable = {
		Write-Warning "TODO: Disable autoupdate"

		Set-SymlinkedPath "./app/Data" "./data" Directory
		
		Export-Command "subl" "./app/subl.exe" -NoSymlink
		Export-Shortcut "Sublime Text" "./app/sublime_text.exe"
	}
}
