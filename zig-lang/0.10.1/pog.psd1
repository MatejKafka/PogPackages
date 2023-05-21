@{
	Name = "zig-lang"
	Architecture = "x64"
	Description = "The Zig language. https://ziglang.org/"
	Version = "0.10.1"

	Install = @{
		Url = {"https://ziglang.org/download/$($this.Version)/zig-windows-x86_64-$($this.Version).zip"}
		Hash = "5768004E5E274C7969C3892E891596E51C5DF2B422D798865471E05049988125"
	}

	Enable = {
		Assert-Directory "./cache"

		Export-Command "zig" "./.pog/zig_wrapper.cmd" -NoSymlink
	}
}
