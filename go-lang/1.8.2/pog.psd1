@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.8.2"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "9bfa4d497caee1b7ec8720acdea2fa8af8d51b525ddc7e4648a63a3138a6a8e3"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
