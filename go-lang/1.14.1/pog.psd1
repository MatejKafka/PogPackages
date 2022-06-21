@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14.1"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "4bcc3bbdeba4b298120b4ea78e22b8c0fe93478b47dd7b84d70d97d2b264a0a6"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
