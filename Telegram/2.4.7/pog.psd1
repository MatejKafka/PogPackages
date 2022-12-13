@{
	Name = "Telegram"
	Architecture = "x86"
	Version = "2.4.7"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/telegramdesktop/tdesktop/releases/download/v${V}/tportable.${V}.zip"}
		Hash = "8DF10352FFA08798389146E88F61ED7042CEEE1E031B72BAA2B9200F7868C595"
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

