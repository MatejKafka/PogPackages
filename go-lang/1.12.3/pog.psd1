@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.12.3"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "1806e089e85b84f192d782a7f70f90a32e0eccfd181405857e612f806ec04059"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
