@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.18.3"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "9c46023f3ad0300fcfd1e62f2b6c2dfd9667b1f2f5c7a720b14b792af831f071"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
