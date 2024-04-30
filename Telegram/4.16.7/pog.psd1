@{
	Name = "Telegram"
	Architecture = "x64"
	Version = "4.16.7"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/telegramdesktop/tdesktop/releases/download/v${V}/tportable-x64.${V}.zip"}
		Hash = "D02931F048E59562883861140F6F625819EF9D0337208C2485121EAA813E934A"
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

