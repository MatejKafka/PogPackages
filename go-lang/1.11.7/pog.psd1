@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.11.7"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "7d2a8f2f90f4e989bd3fcb8ab70949a0a3cdb0ed416cd9f61768b4cfc214c09e"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
