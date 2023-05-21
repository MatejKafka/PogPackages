@{
	Name = "PhotoDemon"
	Version = "8.4"
	Architecture = "x64"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/tannerhelland/PhotoDemon/releases/download/v${V}/PhotoDemon-${V}.zip"}
		Hash = "FB6DEBAA50C976D1A717E412FE0E5E3BD82EE3EA083014DA600AFE29E9093361"
	}
	
	Enable = {
		Set-SymlinkedPath "./app/Data" "./data" Directory
		Export-Shortcut "PhotoDemon" "./app/PhotoDemon.exe"
	}
}
