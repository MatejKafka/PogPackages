@{
	Name = 'Regshot'
	Architecture = @('x86', 'x64')
	Version = '1.9.0'

	Install = @{
		Url = {$V = $this.Version; "https://sourceforge.net/projects/regshot/files/regshot/${V}/Regshot-${V}.7z/download"}
		Hash = "A92327FFA25F456DFF86BAE60D42DC8E85E8F3CF987D1D0449D0402A39827D85"
	}

	Enable = {
		Assert-Directory "./data"
		Set-SymlinkedPath "./app/language.ini" "./data/language.ini" File
		Set-SymlinkedPath "./app/regshot.ini" "./data/regshot.ini" File

		if ([Environment]::Is64BitOperatingSystem) {
			Export-Shortcut "Regshot" "./app/Regshot-x64-Unicode.exe"
		} else {
			Export-Shortcut "Regshot" "./app/Regshot-x86-Unicode.exe"
		}
	}
}
