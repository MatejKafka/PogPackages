@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.11.4"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "eeb20e21702f2b9469d9381df5de85e2f731b64a1f54effe196d0f7d0227fe14"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
