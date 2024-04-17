@{
	Name = "haxe-lang"
	Version = "4.2.4"
	Architecture = "x64"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/HaxeFoundation/haxe/releases/download/${V}/haxe-${V}-win64.zip"}
		Hash = "CDBCEC5FEE9178A307E6BCBB436F8FF124DD2C18F86AD51E3D0A7A4EF489877A"
	}

	Enable = {
		Export-Command "haxe" "./app/haxe.exe" -VcRedist
	}
}
