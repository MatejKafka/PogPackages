@{
	Name = "ffmpeg"
	Description = "A complete, cross-platform solution to record, convert and stream audio and video."
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/GyanD/codexffmpeg/releases/download/${V}/ffmpeg-${V}-full_build.7z"}
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Export-Command "ffmpeg" "./app/bin/ffmpeg.exe" -Symlink
		Export-Command "ffplay" "./app/bin/ffplay.exe" -Symlink
		Export-Command "ffprobe" "./app/bin/ffprobe.exe" -Symlink
	}
}
