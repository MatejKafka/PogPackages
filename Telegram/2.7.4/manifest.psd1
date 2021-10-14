@{
	Name = "Telegram"
	Architecture = "x86"
	
	Version = "2.7.4"
	_Hash = "ADFDD64E004FCD2C91F8ACD34616BA595F95F769765703FBD6FAEC389E167448"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/telegramdesktop/tdesktop/releases/download/v$Version/tportable.$Version.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./data"
		
		# TODO: todo figure out how to move log.txt to separate directory
		
		Export-Shortcut "Telegram" "./app/Telegram.exe" -ArgumentList @(
				"-workdir", (Resolve-Path "./data")
				"-noupdate"
				"-externalupdater"
		)
	}
}

