@{
	Name = "Insomnia"
	Architecture = "x64"
	Version = "2023.5.8"

	Install = @{
		# nupkg? eh, seems to work and contain the same stuff as the other (more complicated) formats offered
		Url = {$V = $this.Version; "https://github.com/Kong/insomnia/releases/download/core%40${V}/insomnia-${V}-full.nupkg"}
		Hash = "C40D1AA64DDB58711378BD2ECB613A32A1974E6732AEC4B22AF05C8D063FDBFA"
		Subdirectory = "lib/net45"
	}

	# https://github.com/portapps/insomnia-portable/blob/master/main.go
	Enable = {
		New-Directory "./data"
		New-Directory "./cache/AppData/Roaming/Insomnia"

		Export-Shortcut "Insomnia" "./app/insomnia.exe" -Environment @{
			INSOMNIA_DATA_PATH = "./data"
			INSOMNIA_DISABLE_AUTOMATIC_UPDATES = "true"
			# Electron crashpad (crash reporter) ignores data path and writes stuff to USERPROFILE/AppData/Roaming
			USERPROFILE = "./cache"
			APPDATA = "./cache/AppData/Roaming"
		}
	}
}