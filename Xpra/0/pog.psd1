@{
	Name = "Xpra"
	Version = "0"
	Architecture = "x64"
	
	Install = @{
		Url = "https://xpra.org/dists/windows/Xpra-Client-x86_64.zip"
	}
	
	Enable = {
		Assert-Directory .\config
		Assert-Directory .\logs

		$Env = @{
			# see http://xpra.org/trac/browser/xpra/tags/v4.0.x/src/xpra/platform/paths.py
			# as docs are (or at least were at the time of writing) outdated
			XPRA_USER_CONF_DIRS = "./config"
			XPRA_SYSTEM_CONF_DIRS = "./config"
			XPRA_LOG_FILENAME = "./logs/Xpra.log"
		}
		
		Export-Shortcut "Xpra" "./app/Xpra.exe" -Environment $Env
		Export-Command "xpra" "./app/Xpra_cmd.exe" -Environment $Env
		Export-Command "xpra-launcher" "./app/Xpra-Launcher.exe" -Environment $Env
	}
}
