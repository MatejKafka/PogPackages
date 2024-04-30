@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		New-Directory "./config"
		New-Directory "./cache/build-cache"
		New-Directory "./cache/mod-cache"
		New-Directory "./data/go-bin"
		New-Directory "./data/packages"

		# TODO: switch to writing ./config/goenv file in manifest and only set GOENV here
		#  however, if user runs with GOENV disabled, go will start writing globally, which might be an issue
		Export-Command "go" "./app/bin/go.exe" -Environment @{
			GOROOT = "./app"
			GOBIN = "./data/go-bin"
			GOENV = "./config/goenv"
			GOCACHE = "./cache/build-cache"
			GOMODCACHE = "./cache/mod-cache"
			GOPATH = "%GOPATH%", "./data/packages"
		}
	}
}
