@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.18.2"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "41fc44109c39a98e0c3672989ac5ad205cbb5768067e099dc4fb2b75cba922cf"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
