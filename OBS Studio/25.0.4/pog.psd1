@{
	Name = "OBS Studio"
	Architecture = "x64"
	Version = "25.0.4"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/obsproject/obs-studio/releases/download/${V}/OBS-Studio-${V}-Full-x64.zip"}
		Hash = "DB6214DCE625F429369F6E537A86C48ADBFA2D123B204F3E347B02CEAACA1B93"
		NoSubdirectory = $true
	}
	
	Enable = {
		# when OBS finds this file, it runs in portable mode
		Assert-File "./app/portable_mode.txt"
		
		Set-SymlinkedPath "./app/config/obs-studio" "./config" Directory
		Set-SymlinkedPath "./config/logs" "./logs" Directory
		Set-SymlinkedPath "./config/profiler_data" "./cache/profiler_data" Directory
		
		# disable auto-updater
		& ./.pog/DisableAutoUpdater.ps1
		
		Export-Shortcut "OBS Studio" "./app/bin/64bit/obs64.exe"
	}
}
