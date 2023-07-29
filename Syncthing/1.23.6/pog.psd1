@{
	Name = "Syncthing"
	Version = "1.23.6"
	Architecture = "x64"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/syncthing/syncthing/releases/download/v${V}/syncthing-windows-amd64-v${V}.zip"}
		Hash = "81B57ED5108149F641484AD518E4971802C48DCBB1985E3F030556336449B97E"
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

		Assert-File "./config/config.xml" {
			Write-Verbose "Generating initial config..."
			& $SyncthingCmd -generate="./config"
		}
	}
}
