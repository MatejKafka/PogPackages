@{
	Name = 'Intel Architecture Code Analyzer'
	Architecture = 'x64'
	Version = '3.0'

	Install = @{
		Url = "https://www.intel.com/content/dam/develop/external/us/en/protected/iaca-version-v3.0-win64.zip"
		Hash = "984D76E6AE2DB2A5F6F2C7F76A88F727CA0D543DBF4A30DDBABA543D052FE159"
	}

	Enable = {
		Export-Command "iaca" "./app/iaca.exe" -Symlink
	}
}
