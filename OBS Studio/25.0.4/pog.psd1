@{
	Name = "OBS Studio"
	Architecture = "x64"
	Version = "25.0.4"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/obsproject/obs-studio/releases/download/${V}/OBS-Studio-${V}-Full-x64.zip"}
		Hash = "DB6214DCE625F429369F6E537A86C48ADBFA2D123B204F3E347B02CEAACA1B93"
		Subdirectory = "."
	}

	Enable = {
		# when OBS finds this file, it runs in portable mode
		New-File "./app/portable_mode.txt"

		New-Symlink "./app/config/obs-studio" "./config" Directory
		New-Symlink "./config/logs" "./logs" Directory
		New-Symlink "./config/profiler_data" "./cache/profiler_data" Directory

		# disable auto-updater
		New-File "./config/global.ini" {
			"[General]`n" +`
			"EnableAutoUpdates=false`n"
		} {
			$File = $_
			# TODO: FIXME: not very robust, ideally would use .ini parser
			$c = Get-Content -Raw $File
			if ($c.Contains("`nEnableAutoUpdates=")) {
				if ($c.Contains("`nEnableAutoUpdates=false")) {return}
				# change true to false
				$c = $c.Replace("`nEnableAutoUpdates=true", "`nEnableAutoUpdates=false")
			} else {
				# add config option to [General]
				$c = $c.Replace("[General]`n", "[General]`nEnableAutoUpdates=false`n")
			}
			$c | Set-Content $File
			return
		}

		Export-Shortcut "OBS Studio" "./app/bin/64bit/obs64.exe" -VcRedist
	}
}
