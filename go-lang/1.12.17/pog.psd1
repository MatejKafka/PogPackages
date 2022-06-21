@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.12.17"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "78ba5f19feaea1cf9327c8d3af69278a8476995d145ba57edd01ab5c1c6ecea7"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
