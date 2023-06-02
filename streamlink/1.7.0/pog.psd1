@{
	Name = "streamlink"
	Version = "1.7.0"
	Architecture = "x64"
	
	Install = @{
		Url = "https://github.com/beardypig/streamlink-portable/releases/download/1.7.0/streamlink-portable-1.7.0-py3.6.5-amd64.zip"
		Hash = "CA757BB1C1D78049474A3577E067C136B8AC96D98777B9EBF25D19D337FEAAC6"
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./config/plugins"
		
		# overwrite launcher to use our config and plugin dir
		$this._launcherStr > ./app/streamlink.bat
		
		Export-Command "streamlink" "./app/streamlink.bat"
	}
	
	_launcherStr = @"
@echo off
REM Change the code page for UTF8
chcp 65001 >NUL
set PYTHONIOENCODING=cp65001
"%~dp0\python\python.exe" "%~dp0\streamlink-script.py" --ffmpeg-ffmpeg "%~dp0\ffmpeg\ffmpeg.exe" --rtmp-rtmpdump "%~dp0\rtmpdump\rtmpdump.exe" --plugin-dirs "%~dp0\..\config\plugins" --config "%~dp0\..\config\streamlinkrc" %* --no-version-check
"@
}
