@{
	Name = "WinSCP"
	Architecture = "x64"
	Version = "6.1.1"
	
	Install = @{
		# WinSCP authors don't want people to automate downloads directly from WinSCP site, and are trying to block it
		#  with generated one-time download URLs, so we'll use sourceforge instead
		Url = {$V = $this.Version; "https://downloads.sourceforge.net/project/winscp/WinSCP/${V}/WinSCP-${V}-Portable.zip"}
		Hash = "422EA208DF18D288767D68CE7EBC7AC01C850EEEE66C285F3E17505BB8C36229"
		UserAgent = "Wget"
	}
	
	Enable = {
		Assert-Directory "./cache"
		Assert-Directory "./config"
		Assert-Directory "./data"
		
		Assert-File "./config/WinSCP.ini" {$this._DefaultConfig}
		Set-SymlinkedPath "./app/WinSCP.ini" "./config/WinSCP.ini" File
	
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
