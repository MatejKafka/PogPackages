@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.17.2"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "fa6da0b829a66f5fab7e4e312fd6aa1b2d8f045c7ecee83b3d00f6fe5306759a"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
