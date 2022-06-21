@{
	Name = "Syncthing"
	Architecture = "x64"
	
	Version = "1.19.1"
	_Hash = "285800C8C6F2B3FDA9B367EC34717B47E3A432E2B8BFD12185CAAA32B5D5CFBB"
	
	Install = {
		$Version = $this.Version
		$Url = "https://github.com/syncthing/syncthing/releases/download/v$Version/syncthing-windows-amd64-v$Version.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		Assert-Directory "./logs"
	
		if (-not (Test-Path "./config/config.xml")) {
			Write-Verbose "Generating initial config..."
			$null = & "./.pog/syncthing_wrapper.cmd" -generate="./config"
		} else {
			Write-Verbose "Config is already initialized."
		}
	
		Export-Command "syncthing" "./.pog/syncthing_wrapper.cmd" -NoSymlink
	}
}
