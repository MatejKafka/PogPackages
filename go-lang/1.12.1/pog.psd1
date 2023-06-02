@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.12.1"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "2f4849b512fffb2cf2028608aa066cc1b79e730fd146c7b89015797162f08ec5"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
