@{
	Name = "ffmpeg"
	Description = "A complete, cross-platform solution to record, convert and stream audio and video."
	Architecture = "x64"
	Version = "5.1.1"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/GyanD/codexffmpeg/releases/download/${V}/ffmpeg-${V}-full_build.7z"}
		Hash = "0472727DBFC7B60858310B147A1C4237CB87C54B488B76031DF383541C888EF0"
	}
	
	Enable = {
		Export-Command "ffmpeg" "./app/bin/ffmpeg.exe" -Symlink
		Export-Command "ffplay" "./app/bin/ffplay.exe" -Symlink
		Export-Command "ffprobe" "./app/bin/ffprobe.exe" -Symlink
	}
}
