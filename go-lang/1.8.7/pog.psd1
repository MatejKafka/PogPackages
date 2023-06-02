@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.8.7"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "633a28e72b95e8372e5416dd4723881d7a7109be08daf097ebce2679939f6a82"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
