@{
	Name = "meson-build"
	Architecture = "*"

	Version = "0.56.0"
	_Hash = "291DD38FF1CD55FCFCA8FC985181DD39BE0D3E5826E5F0013BF867BE40117213"

#	Dependencies = @{
#		"ninja-build" = ">=1.10.2" # FIXME: probably needlessly high version requirement
#	}

	Install = {
		$Version = $this.Version
		$Url = "https://github.com/mesonbuild/meson/releases/download/$Version/meson-$Version.tar.gz"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}

	Enable = {
		# TODO: dependency on python, which is currently globally installed
		Export-Command "meson" "./.pog/meson_launcher.cmd" -NoSymlink
	}
}
