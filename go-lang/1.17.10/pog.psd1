@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.17.10"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "ba9198a29fa5c4f322212d21569e8507165c3b34e1ed1f1f9cf6dfb71ddcdeb2"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}