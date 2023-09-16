@{
	Name = "restic"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/restic/restic/releases/download/v${V}/restic_${V}_windows_amd64.zip"}
		Hash = "{{TEMPLATE:Hash}}"

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
	
		Export-Command "restic" "./app/restic.exe" -Arguments @("--cache-dir", "./cache")
	}
}
