@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.11.10"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "e0354b5cef18dbf5867fff022ed4264c441df504f3cb86c90d8b987eca336f78"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
