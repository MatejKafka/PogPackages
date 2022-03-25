@{
	Name = "git"
	Version = "2.35.1"
	Architecture = "x64"

	Install = @{
		Url = {"https://github.com/git-for-windows/git/releases/download/v$($this.Version).windows.1/PortableGit-$($this.Version)-64-bit.7z.exe"}
		Hash = "fe70498dbeee9b3616d9c2a9766279362efdc030dd5ae0c9882f090efdf3d04d"
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
		
		Export-Command "git" "./.pog/git_wrapper.cmd" -NoSymlink
		Export-Command "gitk" "./.pog/gitk_wrapper.cmd" -NoSymlink
	}
}
