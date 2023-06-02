@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.20"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "e8f6d8bbcf3df58d2ba29818e13b04c2e42ba2e4d90d580720b21c34d10bbf68"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
