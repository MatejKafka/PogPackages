@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.53.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "fb5af93227ae95c4535b4b22e11b03d22e9650b2b87dcb72b98b008a5595ac98"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}