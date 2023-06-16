@{
	Name = "Firefox"
	Architecture = "x64"
	Version = "94.0b3"
	
	Install = @{
		# the installer is .exe, but actually it's a self-extracting 7zip archive
		Url = {$V = $this.Version; "https://releases.mozilla.org/pub/firefox/releases/${V}/win64/en-US/Firefox Setup ${V}.exe"}
		Hash = "36988C4F34F6AA1AC4B9315195EF040C2B3366665CBEE7CF23A2C6338D5DE387"
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
