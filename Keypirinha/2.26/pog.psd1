@{
	Name = "Keypirinha"
	Architecture = "x64"
	Version = "2.26"
	
	Install = @{
		Url = {"https://github.com/Keypirinha/Keypirinha/releases/download/v$($this.Version)/keypirinha-$($this.Version)-x64-portable.7z"}
		Hash = "D109A16E6A5CF311ABF6D06BBE5B1BE3B9BA323B79C32A168628189E10F102A5"
	}
	
	Enable = {
		Set-SymlinkedPath "./app/portable/Profile" "./data" Directory
		Set-SymlinkedPath "./app/portable/Local" "./cache" Directory
		
		Export-Shortcut "Keypirinha" "./app/keypirinha.exe"
	}
}
