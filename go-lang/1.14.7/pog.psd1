@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14.7"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "ddf35c01f444f5698dee7b265c172abe29dd7138bef4415e6b60bf322ddcffa5"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
