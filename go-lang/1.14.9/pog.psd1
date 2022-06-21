@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14.9"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "16bb44448c4423740c5fd751bad28061d5ec44cd08272d4e1efdd16cdf8221e9"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
