@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.19.5"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "167db91a2e40aeb453d3e59d213ecab06f62e1c4a84d13a06ccda1d999961caa"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
