@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.11.3"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "bc168207115eb0686e226ed3708337b161946c1acb0437603e1221e94f2e1f0f"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
