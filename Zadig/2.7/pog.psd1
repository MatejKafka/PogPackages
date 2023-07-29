@{
	Name = 'Zadig'
	Description = 'Zadig. USB driver installation made easy. https://zadig.akeo.ie/'
	Architecture = 'x64'
	Version = '2.7'

	Install = @{
		Url = "https://github.com/pbatard/libwdi/releases/download/v1.4.1/zadig-2.7.exe"
		Hash = "AC29BCF79ABBF989F056956FA478E8FD7A339764401467C4A052BF30E7549A49"
		NoArchive = $true
		Target = "zadig.exe"
	}

	Enable = {
		Assert-Directory "./config"
		Set-SymlinkedPath "./app/zadig.ini" "./config/zadig.ini" File

		Export-Shortcut "Zadig" "./app/zadig.exe"
	}
}
