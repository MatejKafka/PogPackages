@{
	Name = "Telegram"
	Architecture = "x64"
	Version = "4.16.6"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/telegramdesktop/tdesktop/releases/download/v${V}/tportable-x64.${V}.zip"}
		Hash = "B7927329D511B6BECAD69F67530CB569E8C2B0419619260FE9127B8581D422CF"
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

