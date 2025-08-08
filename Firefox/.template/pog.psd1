@{
	Name = "Firefox"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		# the installer is .exe, but actually it's a self-extracting 7zip archive
		Url = {$V = $this.Version; "https://releases.mozilla.org/pub/firefox/releases/${V}/win64/en-US/Firefox Setup ${V}.exe"}
		Hash = "{{TEMPLATE:Hash}}"
		Subdirectory = "core"

		SetupScript = {
			# set fixed defaults (disable auto-update, do not create Private mode shortcut,...)
			$null = mkdir "./distribution"
			Set-Content "./distribution/policies.json" $this._PolicyJson
			Write-Information "Created policy file './distribution/policies.json'."
		}
	}

	Enable = {
		New-Directory "./data"
		New-Directory "./cache"

		New-Symlink "./data/datareporting" "./cache/datareporting" Directory
		New-Symlink "./data/cache2" "./cache/cache2" Directory

		$Args = @{
			# originally, `--allow-downgrade` was also passed, but that breaks opening files/URLs by passing them as aguments
			Arguments = @("-profile", "./data")
			Environment = @{
				# disable crash reporter, it writes to AppData
				MOZ_CRASHREPORTER_DISABLE = 1
				# FIXME: these are apparently internal, and Firefox overrides them when starting the crash reporter
				#MOZ_CRASHREPORTER_DATA_DIRECTORY = "./cache/crashreporter"
				#MOZ_CRASHREPORTER_EVENTS_DIRECTORY = "./cache/events"
				#MOZ_CRASHREPORTER_PING_DIRECTORY = "./cache/pings"
			}
		}

		Export-Command "firefox" "./app/firefox.exe" @Args
		Export-Shortcut "Firefox" "./app/firefox.exe" @Args
		Export-Shortcut "Firefox Private Browsing" "./app/private_browsing.exe" @Args
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
