@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.15.8"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "ef05b7141d3c217fb076f0e27249e144296234df96ead8751c0b76784079df97"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
