@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14.3"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "6811c14341fa0e5ebe05b28a4a8086e51a25ee54bc860f83183e1c478e3b1b60"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
