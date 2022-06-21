@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.9.4"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "880e011ac6f4a509308a62ec6d963dd9d561d0cdc705e93d81c750d7f1c696f4"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
