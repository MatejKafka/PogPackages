@{
	Name = "ffmpeg"
	Description = "A complete, cross-platform solution to record, convert and stream audio and video."
	Architecture = "x64"
	Version = "5.1.2"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/GyanD/codexffmpeg/releases/download/${V}/ffmpeg-${V}-full_build.7z"}
		Hash = "037BDB2183189DC0EFA642B1FDE7D6B33C6114036FA06FAF35F777E8DF07D863"
	}
	
	Enable = {
		Export-Command "ffmpeg" "./app/bin/ffmpeg.exe"
		Export-Command "ffplay" "./app/bin/ffplay.exe"
		Export-Command "ffprobe" "./app/bin/ffprobe.exe"
	}
}
