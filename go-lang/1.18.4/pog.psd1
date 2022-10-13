@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.18.4"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "dfb93c517e050ba0cfc066802b38a8e7cda2ef666efd634859356b33f543cc49"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
