@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14.15"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "189bc564d537d86f80c70757ee4c29fb1c2c6e8d05bb6de1242a03a96ac850cb"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
