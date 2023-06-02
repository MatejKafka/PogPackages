@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.17.4"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "903cffeb7c6ab7490b9101086a2b978076bd9356e56369404b9c45dff866da77"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
