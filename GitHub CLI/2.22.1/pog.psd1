@{
	Name = 'GitHub CLI'
	Architecture = 'x64'
	Version = '2.22.1'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/cli/cli/releases/download/v${V}/gh_${V}_windows_amd64.zip"}
		Hash = "B51FDF145F472A63B4DBCB05B5EAC843ABAEFBBB73AEAAB9A67CADEF9C8F22B1"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"

		Export-Command "gh" "./.pog/gh.cmd" -NoSymlink
	}
}
