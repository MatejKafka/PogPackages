@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.12.15"
	_Hash = "80e7a471bef2a05d4729b38762b4534523ac4779c7b32d48ac85eaa490c111a5"
	
	Install = {
		$Url = "https://golang.org/dl/go$($this.Version).windows-amd64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"
	
		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
