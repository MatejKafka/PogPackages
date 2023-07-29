@{
	Name = 'hubfs'
	Architecture = 'x64'
	Version = '1.0B1'

	Install = @{
		Url = "https://github.com/winfsp/hubfs/releases/download/v1.0B1/hubfs-win-1.0.22067.zip"
		Hash = "088EEAF1E5CD262596D9FF41F43E1ECD7587AEE1CE301FB50FF25337723D3B05"
	}

	Enable = {
		Write-Warning "Note that 'hubfs' stores the credentials in the system Credential Manager."
		Export-Command "hubfs" "./app/hubfs.exe" -Symlink
	}
}
