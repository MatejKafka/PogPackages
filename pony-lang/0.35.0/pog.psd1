@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.35.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "5dfc5356450edb83240f4f71aa68836ba9d156d63831f09fe912057844e95a30"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}