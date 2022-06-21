@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.5.4"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "1201053d5659a5fc5c82dff58c3eaee66ecd02901621725cfdfff1681278bd1a"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
