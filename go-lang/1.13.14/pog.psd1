@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.13.14"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "5822f61016ace183bc5f90b58223fa76a5a998b38240846186934954a2e555eb"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
