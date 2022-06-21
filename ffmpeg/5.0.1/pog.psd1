@{
	Name = "ffmpeg"
	Description = "A complete, cross-platform solution to record, convert and stream audio and video."
	Architecture = "x64"
	Version = "5.0.1"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/GyanD/codexffmpeg/releases/download/${V}/ffmpeg-${V}-full_build.7z"}
		Hash = "f62ec21b29871091e16505d53b909120260c7ddf50271d3ead944c04ffbb443b"
	}
	
	Enable = {
		Export-Command "ffmpeg" "./app/bin/ffmpeg.exe"
		Export-Command "ffplay" "./app/bin/ffplay.exe"
		Export-Command "ffprobe" "./app/bin/ffprobe.exe"
	}
}
