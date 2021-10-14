@{
	Name = "MultiMC"
	Architecture = "x86"
	
	Version = "0.6.12"
	_Hash = "309FFFF7D48C6F9EEB4B424B812E03A5AD11785D912FBBB7CA065AB4CDF07688"
	
	Install = {
		$Url = "https://github.com/MultiMC/MultiMC5/releases/download/$($this.Version)/mmc-stable-win32.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./data"
		
		Export-Shortcut "MultiMC" "./.manifest/multimc.cmd" -Icon "./app/MultiMC.exe"
	}
}
