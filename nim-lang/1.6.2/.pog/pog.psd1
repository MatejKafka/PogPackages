@{
	Name = "nim-lang"
	Architecture = "x64"
	Version = "1.6.2"

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
		Hash = "cdb2670bbc1094edc2e78fbbca41cb80f032a01b30913248fa028e79ab3e1567"
	}

	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./data/nimble"
		Assert-Directory "./cache"
		Set-SymlinkedPath "./app/config" "./config" Directory

		# TODO: after Pkg dependencies are figured out, modify nim_wrapper.cmd
		# TODO: add other commands
		Export-Command "nim" "$ManifestRoot/nim_wrapper.cmd" -NoSymlink
		Export-Command "nimble" "$ManifestRoot/nimble_wrapper.cmd" -NoSymlink
	}
}


