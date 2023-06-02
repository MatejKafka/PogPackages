@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.20.1"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "3b493969196a6de8d9762d09f5bc5ae7a3e5814b0cfbf9cc26838c2bc1314f9c"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
