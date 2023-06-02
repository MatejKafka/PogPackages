@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.34.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "a61f1e7f362c6c125f14f073e73ccd1a111a9ca070328c6c5b419cc3e393d7a1"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}