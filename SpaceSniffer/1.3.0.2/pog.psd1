@{
	Name = "SpaceSniffer"
	Architecture = "x64"
	Version = "1.3.0.2"
	
	Install = @{
		Url = {$V = $this.Version.Replace(".", "_"); "http://www.uderzo.it/main_products/space_sniffer/files/spacesniffer_${V}.zip"}
		Hash = "156C45CB53A283D0B919CA8B1E0FAF3B967C896B8A580B962E493A27C7F465C2"
	}
	
	Enable = {
		Set-SymlinkedPath "./app/SpaceSnifferConfig.xml" "./config/SpaceSnifferConfig.xml" File
		
		Disable-DisplayScaling "./app/SpaceSniffer.exe"
		Export-Shortcut "SpaceSniffer" "./app/SpaceSniffer.exe"
	}
}
