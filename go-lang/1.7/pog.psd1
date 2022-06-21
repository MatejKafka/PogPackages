@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.7"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "f51aad06644cc8bd119d2f6933334fa8da24d26e6676fde022cecf5978f1a0c7"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
