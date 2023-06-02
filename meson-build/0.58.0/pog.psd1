@{
	Name = "meson-build"
	Architecture = "*"
	Version = "0.58.0"

#	Dependencies = @{
#		"ninja-build" = ">=1.10.2" # FIXME: probably needlessly high version requirement
#	}

	Install = @{
		Url = {$V = $this.Version; "https://github.com/mesonbuild/meson/releases/download/$V/meson-$V.tar.gz"}
		Hash = "F4820DF0BC969C99019FD4AF8CA5F136EE94C63D8A5AD67E7EB73BDBC9182FDD"
	}

	Enable = {
		# TODO: dependency on python, which is currently globally installed
		Export-Command "meson" "./.pog/meson_launcher.cmd"
	}
}
