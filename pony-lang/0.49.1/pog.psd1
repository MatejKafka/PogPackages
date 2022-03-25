@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.49.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "28fda7afa9bc69cb4e5d77ad6ddbb0ceb4c4a2970f5527d3781df348a2fd9f3e"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}