@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.13.3"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "9585efeab37783152c81c6ce373b22e68f45c6801dc2c208bfd1e47b646efbef"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
