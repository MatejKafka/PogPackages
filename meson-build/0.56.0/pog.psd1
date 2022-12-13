@{
	Name = "meson-build"
	Architecture = "*"
	Version = "0.56.0"

#	Dependencies = @{
#		"ninja-build" = ">=1.10.2" # FIXME: probably needlessly high version requirement
#	}

	Install = @{
		Url = {$V = $this.Version; "https://github.com/mesonbuild/meson/releases/download/$V/meson-$V.tar.gz"}
		Hash = "291DD38FF1CD55FCFCA8FC985181DD39BE0D3E5826E5F0013BF867BE40117213"
	}

	Enable = {
		# TODO: dependency on python, which is currently globally installed
		Export-Command "meson" "./.pog/meson_launcher.cmd" -NoSymlink
	}
}
