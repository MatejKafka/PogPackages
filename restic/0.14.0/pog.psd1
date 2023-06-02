@{
	Name = "restic"
	Architecture = "x64"
	Version = "0.14.0"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/restic/restic/releases/download/v${V}/restic_${V}_windows_amd64.zip"}
		Hash = "E1D81195194F684A0DF34DA1B4FF305D1C033283521C02F36A6F5CDEFFCD6F2D"
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
