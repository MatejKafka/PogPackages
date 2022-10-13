@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.18.7"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "8c23c6ae7777df883ccc2fd07a90c3ac7fab3eb7398c0e2f39c7cb27ee06517e"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
