@{
	Name = "streamlink"
	Architecture = "x64"
	Version = "6.1.0-2"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/streamlink/windows-builds/releases/download/${V}/streamlink-${V}-py311-x86_64.zip"}
		Hash = "0CD8BF1C1FC028A999FF4900B2825D9F35853B11C7091E2A417604F0F5FE9FA4"
	}

	Enable = {
		New-Directory "./config"
		New-Directory "./config/plugins"

		Export-Command "streamlink" "./app/bin/streamlink.exe" -Arguments @("--config", "./config")
		Export-Command "streamlinkw" "./app/bin/streamlinkw.exe" -Arguments @("--config", "./config")
	}
}
