@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.18.10"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "caf3fcc9d39371fc45ad46afad7f6d12b42433c7d7ac593ada6351cd39ee217d"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
