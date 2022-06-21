@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.16.1"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "5349a85c190d953e9d59570cad6798c57b18e0bd93794927f25a89e695a5b5be"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
