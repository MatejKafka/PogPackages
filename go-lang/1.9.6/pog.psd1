@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.9.6"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "0b3a31eb7a46ef3976098cb92fde63c0871dceced91b0a3187953456f8eb8d6e"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
