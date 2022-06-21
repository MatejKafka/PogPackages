@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.15.4"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "3593204e3851be577e4209900ece031b36f1e9ce1671f3f3221c9af7a090a941"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
