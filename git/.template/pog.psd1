@{
	Name = "git"
	Version = "{{TEMPLATE:Version}}"
	Architecture = "x64"

	Install = @{
		Url = {"https://github.com/git-for-windows/git/releases/download/v$($this.Version).windows.1/PortableGit-$($this.Version)-64-bit.7z.exe"}
		Hash = "{{TEMPLATE:Hash}}"
		SetupScript = {
			Write-Information "Running git post-install.bat..."
			# the required arguments are given at the top of the post-install.bat file
			#  (but --no-needs-console seems to break it, and it must not be passed)
			Start-Process "./git-bash.exe" -Wait -ArgumentList "--hide", "--no-cd", "--command=post-install.bat"
		}
	}

	Enable = {
		New-Directory "./config"

		$Env = [ordered]@{
			# prevent Git from looking for systemwide config
			GIT_CONFIG_NOSYSTEM = 1
			# set HOME to config dir, otherwise git would pollute our home dir
			ORIG_HOME = "%HOME%"
			HOME = "./config"
			# tell git to use our custom SSH wrapper, which resets HOME to original value
			GIT_SSH = "./.pog/ssh_wrapper.cmd"
			# git also adds custom paths to PATH, which changes which SSH is used when ssh.exe is called,
			#  so we need to reset it before calling ssh in our wrapper
			ORIG_PATH = "%PATH%"
		}

		Export-Command "git" "./app/cmd/git.exe" -Environment $Env
		Export-Command "gitk" "./app/cmd/gitk.exe" -Environment $Env
	}
}
