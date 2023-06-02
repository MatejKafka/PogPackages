@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.20.4"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "e7528da720f470b711fbd826814167a5fe1bc02a479ab1958dcf839a8294e6d2"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
