@{
	Name = 'marp'
	Architecture = 'x64'
	Version = '3.1.0'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/marp-team/marp-cli/releases/download/v${V}/marp-cli-v${V}-win.zip"}
		Hash = "7157067015A2077613CE2A59FC7969B58868E16B073D099F850FFDC2794AA292"
	}

	Enable = {
		Export-Command "marp" "./app/marp.exe" -Symlink
	}
}
