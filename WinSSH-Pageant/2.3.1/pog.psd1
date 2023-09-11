@{
	Name = 'WinSSH-Pageant'
	Architecture = 'x64'
	Version = '2.3.1'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/ndbeals/winssh-pageant/releases/download/v${V}/winssh-pageant-v${V}_amd64.zip"}
		Hash = "D6E32877B309F350A1430295932CCD3AC2C05CDE7B0E6088212DEBEE420EC6B2"
	}

	Enable = {
		Export-Command "winssh-pageant" "./app/winssh-pageant.exe" -Symlink
	}
}