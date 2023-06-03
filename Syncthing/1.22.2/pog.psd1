@{
	Name = "Syncthing"
	Version = "1.22.2"
	Architecture = "x64"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/syncthing/syncthing/releases/download/v${V}/syncthing-windows-amd64-v${V}.zip"}
		Hash = "D7FAB2DA5687609D8B5FEB5C3278790EAA4A3C148E46567B08C4C8329CC82C3A"
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		Assert-File "./logs/syncthing.log"
	
		$CmdArgs = @("-data", (Resolve-Path "./data"), "-config", (Resolve-Path "./config"), "-logfile", (Resolve-Path "./logs/syncthing.log"))
		$SyncthingCmd = Export-Command "syncthing" "./app/syncthing.exe" -Arguments $CmdArgs -Environment @{
			STNODEFAULTFOLDER = "true"
			STNOUPGRADE = "true"
		} -PassThru

		if (-not (Test-Path "./config/config.xml")) {
			Write-Verbose "Generating initial config..."
			$null = & $SyncthingCmd -generate="./config"
		} else {
			Write-Verbose "Config is already initialized."
		}
	}
}
