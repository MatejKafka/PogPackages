@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.52.4"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "16aa63b7d5661b68caf9e6d1aa0889fdf130e285c76753095c59abb938f2bbd8"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}