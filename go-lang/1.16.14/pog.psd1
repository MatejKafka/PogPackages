@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.16.14"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "df3760d564477e5fc5ffb79496ca4b6667f7dd6d30f1baae9be83f7cc726a071"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
