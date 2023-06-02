@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.15.2"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "e72782cc6de233188c75b06849368826eaa1b8bd9e1cd766db9466a12b7138ca"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
