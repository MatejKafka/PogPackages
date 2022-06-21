@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.10.6"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "fc57f16c23b7fb41b664f549ff2ed6cca340555e374c5ff52fa296cd3f228f32"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
