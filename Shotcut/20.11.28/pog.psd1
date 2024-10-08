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
		New-Directory "./cache"
		New-Directory "./data"

		# disable built-in updater and redirect config dir
		Export-Shortcut "Shotcut" "./app/Shotcut.exe" `
			-ArgumentList @("--noupgrade", "--appdata", "./data") `
			-Environment @{
				QT_DISABLE_SHADER_DISK_CACHE = 1 # cannot seem to redirect this cache
				QT3D_WRITABLE_CACHE_PATH = "./cache"
				QML_DISK_CACHE_PATH = "./cache"
			}
	}
}
