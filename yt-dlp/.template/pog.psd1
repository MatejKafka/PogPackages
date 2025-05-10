@{
	Name = 'yt-dlp'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		# yt-dlp loads a list of config files, starting from the portable one; config files are loaded until one of the config files
		#  specifies `--ignore-config`; we symlink the portable config and ensure that it contains `--ignore-config`

		# an alternative option would be to pass `--ignore-config --config-location ...`, but that changes the behavior in cases
		#  where the user passes `--config-location`, as our config will be skipped (`--config-location` takes a scalar value from the last arg)

		New-File "./config/yt-dlp.conf" {$this._IgnoreConfigStr} {
			$IgnoreLine = cat $_ | ? {$_ -notlike "#*"} | ? {$_ -match '(^|\s)--ignore-config(\s|$)'}
			if (-not $IgnoreLine) {
				"`n`n" + $this._IgnoreConfigStr >> $_
			}
		}

		New-Symlink "./app/yt-dlp.conf" "./config/yt-dlp.conf" File
		New-Directory "./config/plugins"

		Export-Command "yt-dlp" "./app/yt-dlp.exe" -Arguments "--no-plugin-dirs", "--plugin-dirs", "./config/plugins"
	}

	_IgnoreConfigStr = @"
# POG: do not load any other non-portable config files by default
--ignore-config
"@
}