@{
	Name = "WinSCP"
	Architecture = "x64"
	Version = "5.21.6"	
	
	Install = @{
		# WinSCP authors don't want people to automate downloads directly from WinSCP site, and are trying to block it
		#  with generated one-time download URLs, so we'll use sourceforge instead
		Url = {$V = $this.Version; "https://downloads.sourceforge.net/project/winscp/WinSCP/${V}/WinSCP-${V}-Portable.zip"}
		Hash = "08DC66A9A5C83148F069399CB6919E58FE0D1A5E267D44452416D0ABA7B35912"
		UserAgent = "Wget"
	}
	
	Enable = {
		Assert-Directory "./cache"
		Assert-Directory "./config"
		Assert-Directory "./data"
		
		Assert-File "./config/WinSCP.ini" {$this._DefaultConfig}
		Set-SymlinkedPath "./app/WinSCP.ini" "./config/WinSCP.ini" File
	
		# this cannot be symlink, otherwise WinSCP wouldn't find its config file
		Export-Command "winscp" "./app/WinSCP.com" -NoSymlink
		Export-Shortcut "WinSCP" "./app/WinSCP.exe" -StartMaximized
	}
	
	_DefaultConfig = @"
[Configuration\Interface]
RandomSeedFile=../data/winscp.rnd
DDTemporaryDirectory=../cache
"@
}
