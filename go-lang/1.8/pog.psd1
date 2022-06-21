@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.8"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "cb27fe210f3a9d10329d48514895d2a1e3651125a7c3c758f0358a5bfc0e3060"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
