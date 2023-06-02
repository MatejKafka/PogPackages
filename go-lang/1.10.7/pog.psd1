@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.10.7"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "791e2d5a409932157ac87f4da7fa22d5e5468b784d5933121e4a747d89639e15"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
