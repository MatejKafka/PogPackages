@{
	Name = "Syncthing"
	Version = "{{TEMPLATE:Version}}"
	Architecture = "x64"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/syncthing/syncthing/releases/download/v${V}/syncthing-windows-amd64-v${V}.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		Assert-File "./logs/syncthing.log"
	
		$CmdArgs = @("-data", "./data", "-config", "./config", "-logfile", "./logs/syncthing.log")
		$CmdEnv = @{
			STNODEFAULTFOLDER = "true"
			STNOUPGRADE = "true"
		}

		$SyncthingCmd = Export-Command "syncthing" "./app/syncthing.exe" -Arguments $CmdArgs -Environment $CmdEnv -PassThru

		Assert-File "./config/config.xml" {
			Write-Verbose "Generating initial config..."
			& $SyncthingCmd -generate="./config"
		}
	}
}
