@{
	Name = "Thunderbird"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		# the installer is .exe, but actually it's a self-extracting 7zip archive
		Url = {$V = $this.Version; "https://releases.mozilla.org/pub/thunderbird/releases/${V}/win64/en-US/Thunderbird Setup ${V}.exe"}
		Hash = "{{TEMPLATE:Hash}}"
		Subdirectory = "core"

		SetupScript = {
			# set fixed defaults (disable auto-update)
			$null = mkdir "./distribution"
			Set-Content "./distribution/policies.json" $this._PolicyJson
			Write-Information "Created policy file './distribution/policies.json'."
		}
	}

	Enable = {
		Write-Warning "Thunderbird crash reporter writes to registry."

		New-Directory "./data"
		New-Directory "./cache"

		New-Symlink "./data/datareporting" "./cache/datareporting" Directory
		New-Symlink "./data/cache2" "./cache/cache2" Directory

		Export-Shortcut "Thunderbird" "./app/thunderbird.exe" `
			-Arguments @("-profile", "./data", "--allow-downgrade") `
			-Environment @{
				# FIXME: this does not seem to work, unlike with Firefox
				# disable crash reporter, it writes to AppData
				MOZ_CRASHREPORTER_DISABLE = 1
			}
	}

	_PolicyJson = @'
{
	"policies": {
		"DisableAppUpdate": true,
	}
}
'@
}
