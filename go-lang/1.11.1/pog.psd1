@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.11.1"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "230a08d4260ded9d769f072512a49bffe8bfaff8323e839c2db7cf7c9c788130"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
