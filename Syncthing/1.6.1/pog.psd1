@{
	Name = "Syncthing"
	Architecture = "x64"
	
	Version = "1.6.1"
	_Hash = "CA336AF48100B52B70A5419165AFB2F104E45AC206F75D70DDEF5B9A458F1B78"
	
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
