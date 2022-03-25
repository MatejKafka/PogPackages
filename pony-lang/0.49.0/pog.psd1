@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.49.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "b0d425c07440dc7f9f9e1190876dedc6d2928c60c194276ee92562d362b8b798"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}