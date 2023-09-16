@{
	Name = "Telegram"
	Architecture = "x86"
	Version = "2.7.4"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/telegramdesktop/tdesktop/releases/download/v${V}/tportable.${V}.zip"}
		Hash = "ADFDD64E004FCD2C91F8ACD34616BA595F95F769765703FBD6FAEC389E167448"
	}
	
	Enable = {
		Assert-Directory "./data"
		
		# TODO: todo figure out how to move log.txt to separate directory
		
		Export-Shortcut "Telegram" "./app/Telegram.exe" -ArgumentList @(
				"-workdir", "./data"
				"-noupdate"
				"-externalupdater"
		)
	}
}

