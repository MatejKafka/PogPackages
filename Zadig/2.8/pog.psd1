@{
	Name = 'Zadig'
	Description = 'Zadig. USB driver installation made easy. https://zadig.akeo.ie/'
	Architecture = 'x64'
	Version = '2.8'

	Install = @{
		Url = "https://github.com/pbatard/libwdi/releases/download/v1.5.0/zadig-2.8.exe"
		Hash = "20E4CD7B6768718848F603FE928F36E207DC5CA96FC9DB7085D841410D0ABAE4"
		NoArchive = $true
		Target = "zadig.exe"
	}

	Enable = {
		Assert-Directory "./config"
		Set-SymlinkedPath "./app/zadig.ini" "./config/zadig.ini" File

		Export-Shortcut "Zadig" "./app/zadig.exe"
	}
}
