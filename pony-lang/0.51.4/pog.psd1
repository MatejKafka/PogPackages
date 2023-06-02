@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.51.4"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "eabff9ef52024ec6e99f8f56b7fb52b35940f7189a6f8c723fa94b1374c7d9b7"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}