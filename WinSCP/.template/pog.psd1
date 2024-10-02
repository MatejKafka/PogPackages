@{
	Name = "WinSCP"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		# WinSCP authors don't want people to automate downloads directly from WinSCP site, and are trying to block it
		#  with generated one-time download URLs, so we'll use sourceforge instead
		Url = {$V = $this.Version; "https://downloads.sourceforge.net/project/winscp/WinSCP/${V}/WinSCP-${V}-Portable.zip"}
		Hash = "{{TEMPLATE:Hash}}"
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
