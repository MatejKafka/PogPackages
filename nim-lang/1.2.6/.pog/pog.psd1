@{
	Name = "nim-lang"
	Architecture = "x64"
	Version = "1.2.6"

	Description = @"
Nim is a statically typed compiled systems programming language. It combines successful
concepts from mature languages like Python, Ada and Modula. Its design focuses on efficiency,
expressiveness, and elegance (in that order of priority).
"@

	# TODO: uncomment when dependencies are implemented
#	Dependencies = @{
#		mingw64 = ">=8.0.0"
#	}

	Install = @{
		Url = {"https://nim-lang.org/download/nim-$($this.Version)_x64.zip"}
		# https://nim-lang.org/download/nim-$($this.Version)_x64.zip.sha256
		Hash = "eceb3f514e3cc846274cbfc2f075e0bc039500e799d8aa3eb5bb2ece35ab888c"
	}

	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./data/nimble"
		Assert-Directory "./cache"
		Set-SymlinkedPath "./app/config" "./config" Directory

		# TODO: after Pkg dependencies are figured out, modify nim_wrapper.cmd
		# TODO: add other commands
		Export-Command "nim" "./.pog/nim_wrapper.cmd" -NoSymlink
		Export-Command "nimble" "./.pog/nimble_wrapper.cmd" -NoSymlink
	}
}


