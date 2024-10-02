@{
	Name = 'RSS Guard'
	Architecture = 'x64'
	Version = '4.7.4'

	Install = @{
		Url = "https://github.com/martinrotter/rssguard/releases/download/4.7.4/rssguard-4.7.4-68c322710-win10.7z"
		Hash = "F69963272497E4EFB91F48A9105F34781CC1B0942FCB1F8F290C115D1C8B4569"
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