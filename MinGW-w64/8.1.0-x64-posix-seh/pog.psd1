@{
	Name = 'MinGW-w64'
	Architecture = 'x64'
	Version = '8.1.0-x64-posix-seh'

	Description = "Old build of MinGW-w64, tested to work with Qt 5.15."

	Install = @{
		Url = "https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/8.1.0/threads-posix/seh/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z"
		Hash = "853970527B5DE4A55EC8CA4D3FD732C00AE1C69974CC930C82604396D43E79F8"
	}

	Enable = {
		# TODO: when I figure out a way to sensibly support exporting a lot of commands with reasonable semantics,
		#  and or the dependency system, export all the commands from ./app/bin
		#  (currently, the best candidate seems to be to have designated bin dir, which we'll optionally scrape and copy to pkg_bin),
		Write-Information "Nothing to do."
	}
}
