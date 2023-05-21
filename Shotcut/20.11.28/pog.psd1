@{
	Name = "Shotcut"
	Architecture = "x64"
	Version = "20.11.28"
	
	Install = @{
		Url = {
			$FileName = "shotcut-win64-" + $this.Version.Replace(".", "") + ".zip"
			"https://github.com/mltframework/shotcut/releases/download/v$($this.Version)/${FileName}"
		}
		Hash = "45CDE8000364A9803776435918D7257AAF66FB5A848EE8D98BA55C395893ED9F"
	}
	
	Enable = {
		Assert-Directory "./data"
		
		# disable built-in updater and redirect config dir
		Export-Shortcut "Shotcut" "./app/Shotcut.exe" `
				-ArgumentList @("--noupgrade", "--appdata", (Resolve-Path "./data"))
	}
}
