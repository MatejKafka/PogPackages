@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.5.3"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "0a863ba10560c51fa6c4d4ad1180abbc3220b7ecd41159160c322f0b19e06460"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
