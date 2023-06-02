@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.16.12"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "83d51801d51dd74baef5f83dcb7c4ecb75b5f46e4145a58e63a15e111743f5f8"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
