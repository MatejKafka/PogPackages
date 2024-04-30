@{
	Name = "Telegram"
	Architecture = "x64"
	Version = "3.2.5"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/telegramdesktop/tdesktop/releases/download/v${V}/tportable-x64.${V}.zip"}
		Hash = "E4B7CCC7276AE14F3292F7C825B891FF786F62983488408450104A321A409817"
	}

	Enable = {
		New-Directory "./data"

		# TODO: todo figure out how to move log.txt to separate directory

		Export-Shortcut "Telegram" "./app/Telegram.exe" -ArgumentList @(
				"-workdir", "./data"
				"-noupdate"
				"-externalupdater"
		)
	}
}

