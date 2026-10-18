@{
	Name = "ffmpeg@jellyfin"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Website = "https://github.com/jellyfin/jellyfin-ffmpeg"
	Description = "FFmpeg for Jellyfin with custom extensions and enhancements."

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		# don't export with symlinks, older versions were dynamically linked to shared DLLs in the app dir
		Export-Command "ffmpeg" "./app/ffmpeg.exe"
		Export-Command "ffprobe" "./app/ffprobe.exe"
	}
}
