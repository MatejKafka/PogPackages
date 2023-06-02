@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.16.4"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "d40139b7ade8a3008e3240a6f86fe8f899a9c465c917e11dac8758af216f5eb0"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
