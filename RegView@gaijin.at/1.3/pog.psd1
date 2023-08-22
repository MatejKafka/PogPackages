@{
	Name = "RegView@gaijin.at"
	Architecture = "x64"
	Version = "1.3"

	Description = "RegistryViewer is a viewer application for raw Windows Registry files. https://gaijin.at/"

	Install = @{
		Url = "https://gaijin.at/getit?id=regview"
		Hash = "06927A1722639C7533BF3A4BDD75206FFD4B02F46166C594418B1FB73615C1A3"
	}

	Enable = {
		Assert-Directory "./config"
		Set-SymlinkedPath "./app/RegView.ini" "./config/RegView.ini" File

		Disable-DisplayScaling "./app/RegView.exe"

		Export-Command "RegView" "./app/RegView.exe"
		Export-Shortcut "RegView" "./app/RegView.exe"
	}
}
