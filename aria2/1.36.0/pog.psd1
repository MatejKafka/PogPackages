@{
	Name = 'aria2'
	Architecture = 'x64'
	Version = '1.36.0'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/aria2/aria2/releases/download/release-$V/aria2-$V-win-64bit-build1.zip"}
		Hash = "C82DF5415125B438D72443923FEA7F5F9FDA1F326D0DBFAC6AAB16D58DBB7BF0"
	}

	Enable = {
		Assert-File "./config/aria2.conf"

		Export-Command "aria2c" "./app/aria2c.exe" -Arguments @("--conf-path=" + (Resolve-Path "./config/aria2.conf"))
	}
}
