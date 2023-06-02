@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.19.7"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "2fd57332bc55f6d8c4860afa22301d0a2439ad63ba91e3d96b69c03c824df217"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
