@{
	Name = "pandoc"
	Architecture = "x64"
	
	Version = "2.13"
	_Hash = "C7A0523464AEE871EE8CEB387E87DD50AC8BF61974F50EC45946DF34BC7F7DC6"
	
	Install = {
		$Url = "https://github.com/jgm/pandoc/releases/download/$($this.Version)/pandoc-$($this.Version)-windows-x86_64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Export-Command "pandoc" "./app/pandoc.exe"
	}
}