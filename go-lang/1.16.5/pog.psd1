@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.16.5"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "0a3fa279ae5b91bc8c88017198c8f1ba5d9925eb6e5d7571316e567c73add39d"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
