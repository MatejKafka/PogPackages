@{
	Name = "pypy-lang"
	Version = "3.6-v7.3.1"
	Architecture = "x86"

	Install = @{
		Url = {"https://downloads.python.org/pypy/pypy$($this.Version)-win32.zip"}
		Hash = "752FBE8C4ABEE6468E5CE22AF82818F821DADED36FAA65F3D69423F9C217007A"
	}

	Enable = {
		Export-Command "pypy" "./app/pypy3.exe" -NoSymlink
		Export-Command "pypy3" "./app/pypy3.exe" -NoSymlink
	}
}


