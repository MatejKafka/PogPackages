@{
	Name = "Syncthing"
	Version = "{{TEMPLATE:Version}}"
	Architecture = "x64"

	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		New-Directory "./config"
		New-Directory "./data"
		New-File "./logs/syncthing.log"

		$CmdArgs = @("-data", "./data", "-config", "./config", "-logfile", "./logs/syncthing.log")
		$CmdEnv = @{
			STNODEFAULTFOLDER = "true"
			STNOUPGRADE = "true"
		}

		$SyncthingCmd = Export-Command "syncthing" "./app/syncthing.exe" -Arguments $CmdArgs -Environment $CmdEnv -PassThru

		New-File "./config/config.xml" {
			Write-Verbose "Generating initial config..."
			& $SyncthingCmd -generate="./config"
		}
	}
}
