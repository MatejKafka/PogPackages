@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.11.13"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "55752de84439d0ed744ad681ae0915314516e69091fb86cab9701628ce3a65ff"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
