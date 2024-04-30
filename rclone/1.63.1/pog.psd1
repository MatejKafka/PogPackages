@{
	Name = 'rclone'
	Architecture = 'x64'
	Version = '1.63.1'

	Install = @{
		Url = {$V = $this.Version; "https://downloads.rclone.org/v${V}/rclone-v${V}-windows-amd64.zip"}
		Hash = "66CA083757FB22198309B73879831ED2B42309892394BF193FF95C75DFF69C73"
	}

	Enable = {
		New-File "./config/rclone.conf"

		Export-Command "rclone" "./app/rclone.exe" -Arguments @("--config=" + (Resolve-Path "./config/rclone.conf"))
	}
}
