@{
	Name = "zig-lang"
	Architecture = "x64"
	Description = "The Zig language. https://ziglang.org/"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = {"https://ziglang.org/download/$($this.Version)/zig-windows-x86_64-$($this.Version).zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		Assert-Directory "./cache"

		Export-Command "zig" "./app/zig.exe" -Environment @{
			# https://ziglang.org/download/0.8.0/release-notes.html#Environment-Variable-Alternatives-to-CLI-Options
			ZIG_GLOBAL_CACHE_DIR = "./cache"
		}
	}
}
