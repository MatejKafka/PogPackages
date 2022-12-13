@{
	Name = "haxe-lang"
	Architecture = "x64"
	Version = "4.1.2"

	Install = @{
		URL = "https://github.com/HaxeFoundation/haxe/releases/download/4.1.2/haxe-4.1.2-win64.zip"
		Hash = "A75A685F7AB975FA4749BA990E8AEB395403AB2E977FFECFE5321FC9C6C7000B"
	}

	Enable = {
		Export-Command "haxe" "./app/haxe.exe" -NoSymlink
		# TODO: export haxelib binary
	}
}
