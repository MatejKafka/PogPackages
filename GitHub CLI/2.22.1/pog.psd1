@{
	Name = 'GitHub CLI'
	Architecture = 'x64'
	Version = '2.22.1'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/cli/cli/releases/download/v${V}/gh_${V}_windows_amd64.zip"}
		Hash = "B51FDF145F472A63B4DBCB05B5EAC843ABAEFBBB73AEAAB9A67CADEF9C8F22B1"
	}

	Enable = {
		New-Directory "./config"
		New-Directory "./data"

		Export-Command "gh" "./app/bin/gh.exe" -Environment @{
			GH_CONFIG_DIR = "./config"
			XDG_DATA_HOME = "./data"
			XDG_STATE_HOME = "./data"
		}
	}
}
