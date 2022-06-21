@{
	Name = "streamlink"
	Version = "3.2.0"
	Architecture = "x86"
	
	Install = @{
		Url = "https://github.com/beardypig/streamlink-portable/releases/download/3.2.0/streamlink-portable-3.2.0-py3.10.0-win32.zip"
		Hash = "A5E42D71EBAA2CAFF507859F15F424EE1498B2C0AD1D333926E1CB05F9296470"
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./config/plugins"
		
		Export-Command "streamlink" "./.pog/streamlink.cmd" -NoSymlink
	}
}
