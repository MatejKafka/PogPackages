@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14.5"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "49a638b875409c5aae1a0fdd7c9232b50419d0f85224eb864738542ab99270cb"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
