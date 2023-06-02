@{
	Name = "restic"
	Architecture = "x64"
	Version = "0.13.1"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/restic/restic/releases/download/v${V}/restic_${V}_windows_amd64.zip"}
		Hash = "3E8A768889DD85D952FC7160D196C68866C9155383B0347C4049D079C8AE2CDD"
		SetupScript = {
			$AppFiles = ls
			if (@($AppFiles).Count -ne 1) {
				Write-Warning "Expected the archive to contain a single exe, but multiple items are present."
				return
			}
			Rename-Item $AppFiles "restic.exe"
		}
	}

	Enable = {
		Assert-Directory "./cache"
	
		Export-Command "restic" "./.pog/restic_wrapper.cmd"
	}
}
