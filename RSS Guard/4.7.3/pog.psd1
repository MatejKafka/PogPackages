@{
	Name = 'RSS Guard'
	Architecture = 'x64'
	Version = '4.7.3'

	Install = @{
		Url = "https://github.com/martinrotter/rssguard/releases/download/4.7.3/rssguard-4.7.3-a4e20486b-win10.7z"
		Hash = "9AC14ED48CF88C44B07FC088C759A3BD4ECA1BA8D044DA9908C40D788D6D8111"
	}

	Enable = {
		Write-Warning "RSS Guard writes web cache data to 'AppData/Roaming/RSS Guard/QtWebEngine'."

		New-Directory "./data"
		New-Directory "./cache"

		Export-Shortcut "RSS Guard" "./app/rssguard.exe" -Arguments @("--data", "./data") -Environment @{
			QT_DISABLE_SHADER_DISK_CACHE = 1 # cannot seem to redirect this cache
			QT3D_WRITABLE_CACHE_PATH = "./cache"
			QML_DISK_CACHE_PATH = "./cache"
		}
	}
}