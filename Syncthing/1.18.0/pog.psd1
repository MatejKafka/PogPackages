@{
	Name = "Syncthing"
	Architecture = "x64"
	Version = "1.18.0"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/syncthing/syncthing/releases/download/v${V}/syncthing-windows-amd64-v${V}.zip"}
		Hash = "7b1b0d6461920b5ed7daae99f51130398d8ff3e6f108e77e7dcc3ede5d5ad803"
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
