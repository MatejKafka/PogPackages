@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.10.2"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "0fb4a893796e8151c0b8d0a3da4ed8cbb22bf6d98a3c29c915be4d7083f146ee"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
