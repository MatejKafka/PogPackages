@{
	Name = 'Drawpile'
	Architecture = 'x64'
	Version = '2.2.0-beta.6'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/drawpile/Drawpile/releases/download/${V}/Drawpile-${V}.zip"}
		Hash = "F3FA4A56B0EDE94FCCD0733CB52067F1EABD0A12D107A01487A1C32557E7E3CE"
	}

	Enable = {
		Assert-Directory "./data"

		Export-Shortcut "Drawpile" "./app/drawpile.exe" -Arguments @("--portable-data-dir", "./data")
	}
}