@{
	Name = "ffmpeg"
	Description = "A complete, cross-platform solution to record, convert and stream audio and video."
	Architecture = "x64"
	Version = "6.0"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/GyanD/codexffmpeg/releases/download/${V}/ffmpeg-${V}-full_build.7z"}
		Hash = "EB65985ADBB6AB1C93DEC2B22A3628F6D6A309D0BC5BBDD1E3696F0980905CAD"
	}
	
	Enable = {
		Export-Command "ffmpeg" "./app/bin/ffmpeg.exe" -Symlink
		Export-Command "ffplay" "./app/bin/ffplay.exe" -Symlink
		Export-Command "ffprobe" "./app/bin/ffprobe.exe" -Symlink
	}
}
