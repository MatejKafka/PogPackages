@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.17.3"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "e78684b955742e215926204afc6ed62b9d165b509e25a687d62902516f08726b"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
