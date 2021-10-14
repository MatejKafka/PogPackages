@{
	Name = "ffmpeg"
	Description = "A complete, cross-platform solution to record, convert and stream audio and video."
	Architecture = "x64"
	
	# TODO: only few latest builds are kept, so this gets outdated quite quickly
	Version = "4.3.2-2021-02-27"
	_Hash = "FC7F82A9FE87EF2C58634FD9E2F9C8EB42BC4A02EA7BAAD45F7113B468A7B08D"
	
	Install = {
		$Url = "https://www.gyan.dev/ffmpeg/builds/packages/ffmpeg-$($this.Version)-full_build.7z"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Export-Command "ffmpeg" "./app/bin/ffmpeg.exe"
		Export-Command "ffplay" "./app/bin/ffplay.exe"
		Export-Command "ffprobe" "./app/bin/ffprobe.exe"
	}
}


