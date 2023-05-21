@{
	Name = "restic"
	Architecture = "x64"
	Version = "0.12.1"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/restic/restic/releases/download/v${V}/restic_${V}_windows_amd64.zip"}
		Hash = "F430A8069D7FAC26E93994F8D89419E5285ACBC0FB4514C89F427A070614AF2E"
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
	
		Export-Command "restic" "./.pog/restic_wrapper.cmd" -NoSymlink
	}
}
