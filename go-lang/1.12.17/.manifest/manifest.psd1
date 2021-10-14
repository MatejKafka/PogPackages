@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.12.17"
	_Hash = "78ba5f19feaea1cf9327c8d3af69278a8476995d145ba57edd01ab5c1c6ecea7"
	
	Install = {
		$Url = "https://golang.org/dl/go$($this.Version).windows-amd64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"
	
		Export-Command "go" "./.manifest/go_wrapper.cmd" -NoSymlink
	}
}
