@{
	Name = "WinSCP"
	Architecture = "x64"
	Version = "5.17.8"

	Install = @{
		# WinSCP authors don't want people to automate downloads directly from WinSCP site, and are trying to block it
		#  with generated one-time download URLs, so we'll use sourceforge instead
		Url = {$V = $this.Version; "https://downloads.sourceforge.net/project/winscp/WinSCP/${V}/WinSCP-${V}-Portable.zip"}
		Hash = "bfe8709a90ad3b03618c1856c4f7c70948f045d39c8783ddfe4fe24f69efecb2"
		UserAgent = "Wget"
	}

	Enable = {
		New-Directory "./cache"
		New-Directory "./config"
		New-Directory "./data"

		New-File "./config/WinSCP.ini" {$this._DefaultConfig}
		New-Symlink "./app/WinSCP.ini" "./config/WinSCP.ini" File

		# this cannot be symlink, otherwise WinSCP wouldn't find its config file
		Export-Command "winscp" "./app/WinSCP.com"
		Export-Shortcut "WinSCP" "./app/WinSCP.exe"
	}

	_DefaultConfig = @"
[Configuration\Interface]
RandomSeedFile=../data/winscp.rnd
DDTemporaryDirectory=../cache
"@
}
