@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14.8"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "f0fb99ef42f4b5cc021e48c442eb4c71b2ee7790ed1c3c7a2c5315248536fe98"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
