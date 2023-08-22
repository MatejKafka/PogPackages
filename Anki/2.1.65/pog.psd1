@{
	Name = 'Anki'
	Architecture = 'x64'
	Version = '2.1.65'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/ankitects/anki/releases/download/${V}/anki-${V}-windows-qt6.exe"}
		Hash = "02D992A47FE826254B3DC707226D9D06C006F3FA0DC1E66C9E47767316896ED9"
		NsisInstaller = $true
	}

	Enable = {
		Assert-Directory "./data"

		Export-Shortcut Anki "./app/anki.exe" -Arguments @("-b", (Resolve-Path "./data"))
	}
}
