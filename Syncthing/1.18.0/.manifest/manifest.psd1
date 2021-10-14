@{
	Name = "Syncthing"
	Architecture = "x64"
	
	Version = "1.18.0"
	_Hash = "7b1b0d6461920b5ed7daae99f51130398d8ff3e6f108e77e7dcc3ede5d5ad803"
	
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
			$null = & "./.manifest/syncthing_wrapper.cmd" -generate="./config"
		} else {
			Write-Verbose "Config is already initialized."
		}
	
		Export-Command "syncthing" "./.manifest/syncthing_wrapper.cmd" -NoSymlink
	}
}
