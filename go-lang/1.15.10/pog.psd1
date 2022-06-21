@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.15.10"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "ba30d211e96d57ce2becf17fe9ebe1d958eba29384c5aeb1e99f9209b44dd7c2"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
