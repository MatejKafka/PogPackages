@{
	Name = "Notepad2"
	Architecture = "x64"
	Version = "4.2.25"

	Install = @{
		Url = "https://www.flos-freeware.ch/zip/notepad2_4.2.25_x64.zip"
		Hash = "37A62F7E891335A1E671F444CEFE761FCD814A2FA1A3141FE2501D8433D8920B"
	}

	Enable = {
		New-Directory "./config"
		New-File "./config/Notepad2.ini" "./app/Notepad2.ini"

		Export-Shortcut "Notepad2" "./app/Notepad2.exe" -ArgumentList @("/f", "./config/Notepad2.ini")
	}
}
