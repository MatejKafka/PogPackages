@{
	Name = 'WizTree'
	Architecture = 'x64'
	Version = '4.17'

	Install = @{
		Url = {"https://diskanalyzer.com/files/archive/wiztree_$($this.Version.Replace(".", "_"))_portable.zip"}
		Hash = "E7F38D82BEC6CC5477E8A5B922AA396D3DBFFE637494ED287972C55DB1199522"
	}

	Enable = {
		New-Directory "./config"
		New-Symlink "./app/WizTree3.ini" "./config/WizTree3.ini" File

		Export-Shortcut "WizTree" "./app/WizTree64.exe"
	}
}