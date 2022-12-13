@{
	Name = 'tev@Tom94'
	Architecture = 'x64'
	Version = '1.23'

	Install = @{
		Url = {"https://github.com/Tom94/tev/releases/download/v$($this.Version)/tev.exe"}
		Hash = "8BE862A057AE33AA2BE4E6ABFF5412133E89C68B4B0EA7607D31792135C47386"
		NoArchive = $true
	}

	Enable = {
		Export-Shortcut "Tev" "./app/tev.exe"
		Export-Command "tev" "./app/tev.exe" -Symlink
	}
}
