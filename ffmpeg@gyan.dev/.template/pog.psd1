@{
	Name = "ffmpeg"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Website = "https://www.gyan.dev/ffmpeg/builds/"
	Description = "A complete, cross-platform solution to record, convert and stream audio and video. Builds by <gyan.dev>."

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		Export-Command "ffmpeg" "./app/bin/ffmpeg.exe" -Symlink
		Export-Command "ffplay" "./app/bin/ffplay.exe" -Symlink
		Export-Command "ffprobe" "./app/bin/ffprobe.exe" -Symlink
	}
}
