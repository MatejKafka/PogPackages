@{
	Name = "ffmpeg"
	Description = "A complete, cross-platform solution to record, convert and stream audio and video."
	Architecture = "x64"
	Version = "5.1"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/GyanD/codexffmpeg/releases/download/${V}/ffmpeg-${V}-full_build.7z"}
		Hash = "2E9910937A8626061B78261A00FA807C9A8C1AAD0B878B3E9A8A411176F818AE"
	}
	
	Enable = {
		Export-Command "ffmpeg" "./app/bin/ffmpeg.exe"
		Export-Command "ffplay" "./app/bin/ffplay.exe"
		Export-Command "ffprobe" "./app/bin/ffprobe.exe"
	}
}
