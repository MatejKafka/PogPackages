@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.12.5"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "ccb694279aab39fe0e70629261f13b0307ee40d2d5e1138ed94738023ab04baa"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
