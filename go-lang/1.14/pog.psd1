@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "cc2f1e8d19744fe0b2e979bf9a4f9d224e416f4f54cb6cf3aa8b5e9c0865de37"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
