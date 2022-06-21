@{
	Name = "nim-lang"
	Architecture = "x64"
	Version = "1.0.6"

	Description = @"
Nim is a statically typed compiled systems programming language. It combines successful
concepts from mature languages like Python, Ada and Modula. Its design focuses on efficiency,
expressiveness, and elegance (in that order of priority).
"@

	# TODO: uncomment when dependencies are implemented
	# newer TODO: when multiple source installation is implemented, bundle mingw directly
#	Dependencies = @{
#		mingw64 = ">=8.0.0"
#	}

	Install = @{
		Url = {"https://nim-lang.org/download/nim-$($this.Version)_x64.zip"}
		# https://nim-lang.org/download/nim-$($this.Version)_x64.zip.sha256
		Hash = "cd9585b407ec22c588cb3836862ee113e3e7eea729934eef8f81e0c1210e780d"
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


