@{
	Name = 'qrcp'
	Architecture = 'x64'
	Version = '0.9.1'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/claudiodangelis/qrcp/releases/download/${V}/qrcp_${V}_Windows_x86_64.tar.gz"}
		Hash = "A5EBA52FA410DB35C77CEE4DCE4A07811769945B1707D9BA35A75D4610119E83"
	}

	Enable = {
		Assert-Directory "./config"
		# the config file must be a valid JSON (e.g. not empty)
		Assert-File "./config/config.json" {"{}"}

		Export-Command "qrcp" "./.pog/qrcp.cmd" -NoSymlink
	}
}
