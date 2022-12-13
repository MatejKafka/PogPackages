@{
	Name = "librespeed-cli"
	Architecture = "x64"
	Version = "1.0.7"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/librespeed/speedtest-cli/releases/download/v${V}/librespeed-cli_${V}_windows_amd64.zip"}
		Hash = "635ED0D4A1575C36D00A09C0DD08023AC6E99198B3336656BEDCAA0B6D546F07"
	}
	
	Enable = {
		Export-Command "librespeed-cli" "./app/librespeed-cli.exe"
	}
}
