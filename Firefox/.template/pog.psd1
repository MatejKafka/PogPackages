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
			mkdir "./distribution"
			Set-Content "./distribution/policies.json" $this._PolicyJson
			Write-Information "Created policy file './distribution/policies.json'."
		}
	}
	
	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./cache"

		Set-SymlinkedPath "./data/datareporting" "./cache/datareporting" Directory
		Set-SymlinkedPath "./data/cache2" "./cache/cache2" Directory

		$Arg = @("-profile", "./data", "--allow-downgrade")
		$EnvVars = @{
			# disable crash reporter, it writes to AppData
			MOZ_CRASHREPORTER_DISABLE = 1

			# FIXME: these are apparently internal, and Firefox overrides them when starting the crash reporter
			#MOZ_CRASHREPORTER_DATA_DIRECTORY = "./cache/crashreporter"
			#MOZ_CRASHREPORTER_EVENTS_DIRECTORY = "./cache/events"
			#MOZ_CRASHREPORTER_PING_DIRECTORY = "./cache/pings"			
		}

		Export-Shortcut "Firefox" "./app/firefox.exe" -Arguments $Arg -Environment $EnvVars
		Export-Shortcut "Firefox Private Browsing" "./app/private_browsing.exe" -Arguments $Arg -Environment $EnvVars
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
