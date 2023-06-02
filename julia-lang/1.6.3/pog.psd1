@{
	Name = "julia-lang"
	Architecture = "x64"
	Version = "1.6.3"

	Install = @{
		Url = {
			$V = $this.Version
			$MinorVersion = $V.Substring(0, $V.LastIndexOf("."))
			"https://julialang-s3.julialang.org/bin/winnt/x64/${MinorVersion}/julia-${V}-win64.zip"
		}
		Hash = "e2611dd89a80ce3ff55a9bd72220aff5de151643042c0c99b7dd34f7ba5c68f0"
	}

	Enable = {
		Export-Command "julia" "./.pog/julia.cmd"
	}
}
