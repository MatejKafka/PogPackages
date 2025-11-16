@{
	Name = "mpv"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = {"https://downloads.sourceforge.net/project/mpv-player-windows/release/mpv-$($this.Version)-x86_64.7z"}
		Hash = "{{TEMPLATE:Hash}}"
		# use wget UA, otherwise we are redirected to a HTML page, as sourceforge thinks we're an interactive browser
		UserAgent = "Wget"
	}

	Enable = {
		New-Directory "./config"
		New-Directory "./cache/watch_later"
		New-Directory "./cache/shader_cache"
		New-Directory "./cache/icc_cache"
		New-File "./logs/log.txt"

		$Arguments = @(
			"--config-dir=" + (Resolve-Path ./config)
			"--watch-later-directory=" + (Resolve-Path ./cache/watch_later)
			"--gpu-shader-cache-dir=" + (Resolve-Path ./cache/shader_cache)
			"--icc-cache-dir=" + (Resolve-Path ./cache/icc_cache)
			"--log-file=" + (Resolve-Path ./logs/log.txt)
		)

		Export-Command "mpv" "./app/mpv.com" -Arguments $Arguments
		Export-Shortcut "MPV Player" "./app/mpv.exe" -Arguments $Arguments
	}
}
