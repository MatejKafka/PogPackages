@{
	Name = 'Telegram'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Directory "./data"

		# TODO: todo figure out how to move log.txt to separate directory
		Export-Shortcut "Telegram" "./app/Telegram.exe" -Arguments @(
			"-workdir", "./data"
			"-noupdate"
			"-externalupdater"
		)
	}
}

