@{
	Name = "restic"
	Architecture = "x64"
	Version = "0.11.0"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/restic/restic/releases/download/v${V}/restic_${V}_windows_amd64.zip"}
		Hash = "4D9EC99CEEC71DF88F47C5EBAE5FDD15474F7D36E9685A655830C2FC89AD9153"
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
