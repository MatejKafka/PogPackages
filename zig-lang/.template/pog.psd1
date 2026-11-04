@{
	Name = "zig-lang"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Website = "https://ziglang.org/"
	Description = "Zig is a general-purpose programming language and toolchain for maintaining robust, optimal and reusable software."

	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		New-Directory "./cache"

		Export-Command "zig" "./app/zig.exe" -Environment @{
			# https://ziglang.org/download/0.8.0/release-notes.html#Environment-Variable-Alternatives-to-CLI-Options
			ZIG_GLOBAL_CACHE_DIR = "./cache"
		}
	}
}
