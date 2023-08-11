@{
	Name = 'AppCompatCacheParser'
	Architecture = 'x64'
	Version = '0'

	Install = @{
		Url = "https://f001.backblazeb2.com/file/EricZimmermanTools/net6/AppCompatCacheParser.zip"
	}

	Enable = {
		Export-Command "AppCompatCacheParser" "./app/AppCompatCacheParser.exe"
	}
}