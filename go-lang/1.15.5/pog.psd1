@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.15.5"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "1d24be3a200201a74be25e4134fbec467750e834e84e9c7789a9fc13248c5507"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
