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
		New-Directory "./logs"

		$CmdArgs = @("--data", "./data", "--config", "./config", "--logfile", "./logs/syncthing.log")
		$CmdEnv = @{
			STNODEFAULTFOLDER = "true"
			STNOUPGRADE = "true"
		}

		Export-Command "syncthing" "./app/syncthing.exe" -Arguments $CmdArgs -Environment $CmdEnv
	}
}
