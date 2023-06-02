@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.19"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "bcaaf966f91980d35ae93c37a8fe890e4ddfca19448c0d9f66c027d287e2823a"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
