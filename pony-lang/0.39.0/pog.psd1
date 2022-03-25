@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.39.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "60bb4d872e05e7a79f5b1c097a658360693bfea77b5391e118d8815eb14f777f"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}