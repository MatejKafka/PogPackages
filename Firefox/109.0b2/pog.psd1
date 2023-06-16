@{
	Name = "Firefox"
	Architecture = "x64"
	Version = "109.0b2"
	
	Install = @{
		# the installer is .exe, but actually it's a self-extracting 7zip archive
		Url = {$V = $this.Version; "https://releases.mozilla.org/pub/firefox/releases/${V}/win64/en-US/Firefox Setup ${V}.exe"}
		Hash = "A364E0F128EA36B7CC4DC1A2227F6DC5AB9746675126B3990D460BC0AD8C7B04"
		Subdirectory = "core"
	}
	
	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./cache"

		Assert-File "./app/distribution/policies.json" -FixedContent $this._PolicyJson

		Set-SymlinkedPath "./data/datareporting" "./cache/datareporting" Directory
		Set-SymlinkedPath "./data/cache2" "./cache/cache2" Directory

		Export-Shortcut "Firefox" "./app/firefox.exe" `
			-Arguments @("-profile", (Resolve-Path "./data"), "--allow-downgrade") `
			-Environment @{
				# disable crash reporter, it writes to AppData
				MOZ_CRASHREPORTER_DISABLE = 1

				# FIXME: these are apparently internal, and Firefox overrides them when starting the crash reporter
				#MOZ_CRASHREPORTER_DATA_DIRECTORY = "./cache/crashreporter"
				#MOZ_CRASHREPORTER_EVENTS_DIRECTORY = "./cache/events"
				#MOZ_CRASHREPORTER_PING_DIRECTORY = "./cache/pings"
			}
	}

	_PolicyJson = @'
{
	"policies": {
		"DisableAppUpdate": true,
		"DisableDefaultBrowserAgent": true,
		"DontCheckDefaultBrowser": true,
		
		"Preferences": {
			"browser.privacySegmentation.createdShortcut": {
				"Value": true,
				"Status": "locked"
			}
		}
	}
}
'@
}
