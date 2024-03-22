@{
	Name = 'WinMerge'
	Architecture = 'x64'
	Version = '2.16.32'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/WinMerge/winmerge/releases/download/v${V}/winmerge-${V}-x64-exe.zip"}
		Hash = "80407E2C8C2BAE3CE7C4816A04ACE719289C0C0E3B67CFE1A2AB30A94981D006"
	}

	Enable = {
		Assert-File "./config/WinMerge.ini"

		Export-Command "WinMergeU" "./app/WinMergeU.exe" -Arguments "/inifile", "./config/WinMerge.ini"
		Export-Shortcut "WinMerge" "./app/WinMergeU.exe" -Arguments "/inifile", "./config/WinMerge.ini"
	}
}