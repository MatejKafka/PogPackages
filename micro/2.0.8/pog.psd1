@{
	Name = "micro"
	Architecture = "x64"
	Description = "'nano'-like terminal text editor"
	Version = "2.0.8"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/zyedidia/micro/releases/download/v${V}/micro-${V}-win64.zip"}
		Hash = "C551E5BAC87BDE3AF5157F34B2E84A4A2418E1F51CB6A02F85EC6260950AD966"
	}

	Enable = {
		New-Directory "./config"

		Export-Command "micro" "./app/micro.exe" -Environment @{MICRO_CONFIG_HOME = "./config"}
	}
}
