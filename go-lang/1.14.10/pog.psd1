@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14.10"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "ca216afc0906f113d1c5b3498bb0015204e7ce2fd14091f5a99aae82bfb16af3"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
