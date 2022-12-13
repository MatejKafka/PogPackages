@{
	Name = "MobaXterm"
	Version = "20.3.0"
	Architecture = "x86"
	
	Install = {
		$URL = "https://download.mobatek.net/2032020060430358/MobaXterm_Portable_v20.3.zip"
		Install-FromUrl $URL
	}
	
	Enable = {
		Assert-Directory .\config
		Assert-File .\config\MobaXterm.ini
		
		Export-Shortcut "MobaXterm" "./.pog/launcher.cmd" -IconPath "./app/MobaXterm_Personal_20.3.exe"
	}
}