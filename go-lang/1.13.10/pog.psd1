@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.13.10"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "e56ff68ab0d0ebdd9d11e9f3ef4b47fb7bd3a379cb07d444b9f7d77c7009088a"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
