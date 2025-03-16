@{
	Name = 'AppCompatCacheParser'
	Architecture = 'x64'
	Version = '0'

	Install = @{
		Url = "https://download.ericzimmermanstools.com/AppCompatCacheParser.zip"
	}

	Enable = {
		Export-Command "AppCompatCacheParser" "./app/AppCompatCacheParser.exe"
	}
}