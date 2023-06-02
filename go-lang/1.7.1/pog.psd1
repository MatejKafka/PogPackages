@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.7.1"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "af2b836bb894672cf4c28df32a2ee3ff560e2b463e1ab44bb99833064ba09e5f"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
