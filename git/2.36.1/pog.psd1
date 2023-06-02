@{
	Name = "git"
	Version = "2.36.1"
	Architecture = "x64"

	Install = @{
		Url = {"https://github.com/git-for-windows/git/releases/download/v$($this.Version).windows.1/PortableGit-$($this.Version)-64-bit.7z.exe"}
		Hash = "AF17A2803C5C6406B9B60DFEF2D34F72F218975F9D78DF21005A44F6E2F0CAF9"
	}

	Enable = {
		if (Test-Path "./app/post-install.bat") {
			Write-Information "Running git post-install.bat..."
			# the required arguments are given at the top of the post-install.bat file
			#  (but --no-needs-console seems to break it, and it must not be passed)
			Start-Process "./app/git-bash.exe" -Wait -WorkingDirectory ./app `
					-ArgumentList "--hide", "--no-cd", "--command=post-install.bat"
		} else {
			Write-Verbose "Git post-install.bat already called."
		}
		
		Assert-Directory "./config"
		
		# no symlink, Nim doesn't support resolving symlinks on Windows (https://github.com/nim-lang/Nim/issues/3023)
		Export-Command "git" "./.pog/git.exe"
		Export-Command "gitk" "./.pog/gitk_wrapper.cmd"
	}
}
