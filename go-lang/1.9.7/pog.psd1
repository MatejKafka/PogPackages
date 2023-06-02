@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.9.7"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "8db4b21916a3bc79f48d0611202ee5814c82f671b36d5d2efcb446879456cd28"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
