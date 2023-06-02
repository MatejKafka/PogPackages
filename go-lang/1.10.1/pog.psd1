@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.10.1"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "17f7664131202b469f4264161ff3cd0796e8398249d2b646bbe4990301afc678"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
