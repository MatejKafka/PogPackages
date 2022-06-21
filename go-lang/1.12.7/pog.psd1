@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.12.7"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "502712c0e29edc6b9cda6fa5e4b6ff9b36e27d225373baead8708c9634aa8e50"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
