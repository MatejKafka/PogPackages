@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.17.11"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "88e60b92069d8e0932ca5d8bd8227d1693b9570fa2afbedadcc680749c428d54"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
