@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.12.2"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "4197135ef2221c9d7772063e1bdcd3f51de37811b19a678db87d7fc735a218f9"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
