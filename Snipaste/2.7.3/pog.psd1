@{
	Name = "Snipaste"
	Architecture = "x64"
	Version = "2.7.3"
	
	Install = @{
		Url = {"https://bitbucket.org/liule/snipaste/downloads/Snipaste-$($this.Version)-Beta-x64.zip"}
		Hash = "6E647D9D7946EF83DB435612DFAF76B6EBB9888B9B5476129449215622EDAE1D"
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		Assert-Directory "./logs"
		
		Set-SymlinkedPath "./app/config.ini" "./config/config.ini" File
		Set-SymlinkedPath "./app/splog.txt" "./logs/splog.txt" File
		Set-SymlinkedPath "./app/crashes" "./data/crashes" Directory
		Set-SymlinkedPath "./app/history" "./data/history" Directory
		
		Export-Shortcut "Snipaste" "./app/Snipaste.exe"
		
		# TODO: disable updates by adding the following to config.ini:
		# [Update]
		# check_on_start=false
	}
}
