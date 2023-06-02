@{
	Name = "ffmpeg"
	Description = "A complete, cross-platform solution to record, convert and stream audio and video."
	Architecture = "x64"
	Version = "5.0"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/GyanD/codexffmpeg/releases/download/${V}/ffmpeg-${V}-full_build.7z"}
		Hash = "928e4282818a75bf5115093e5a1687dbc2d30bf94cfd63511fd7460620451f31"
	}
	
	Enable = {
		Export-Command "ffmpeg" "./app/bin/ffmpeg.exe" -Symlink
		Export-Command "ffplay" "./app/bin/ffplay.exe" -Symlink
		Export-Command "ffprobe" "./app/bin/ffprobe.exe" -Symlink
	}
}
