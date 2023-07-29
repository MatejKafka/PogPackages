@{
	Name = "git"
	Version = "2.41.0"
	Architecture = "x64"

	Install = @{
		Url = {"https://github.com/git-for-windows/git/releases/download/v$($this.Version).windows.1/PortableGit-$($this.Version)-64-bit.7z.exe"}
		Hash = "FCBAEFFD24FDF435A1F7844825253509136377915E6720AA66AA256EC1F83C30"
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
