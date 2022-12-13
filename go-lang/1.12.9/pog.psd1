@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.12.9"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "ec7550b32ff080b17060b9d4fde7bee94d9cf3c42e846e3a62fe4a3047ec79e3"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}