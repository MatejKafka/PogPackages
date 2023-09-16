@{
	Name = "Telegram"
	Architecture = "x86"
	Version = "2.4.3"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/telegramdesktop/tdesktop/releases/download/v${V}/tportable.${V}.zip"}
		Hash = "12164BB14BD5D1A5D56C5A202732EF7111FFF3BB5023A702FA7F4D245D4E3BC2"
	}
	
	Enable = {
		Assert-Directory "./data"
	
		# TODO: make a PR to fix this mess
		Write-Warning "Everything is stored in ./data, because Telegram directory structure is completely fucked."
		
		Export-Shortcut "Telegram" "./app/Telegram.exe" -ArgumentList @(
				"-workdir", "./data"
				"-noupdate"
				"-externalupdater"
		)
	}
}

