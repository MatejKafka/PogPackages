@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.13.8"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "aaf0888907144ca7070c8dad03fcf1308f77a42d2f6e4d2a609e64e9ae73cf4f"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
