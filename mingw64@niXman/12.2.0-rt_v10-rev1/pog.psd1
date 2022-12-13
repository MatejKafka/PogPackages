@{
	Name = "mingw64@niXman"
	Architecture = "x64"
	Version = "12.2.0-rt_v10-rev1"
	
	Install = @{
		Url = "https://github.com/niXman/mingw-builds-binaries/releases/download/12.2.0-rt_v10-rev1/x86_64-12.2.0-release-win32-seh-rt_v10-rev1.7z"
		Hash = "774916C4403C5219F8AF3A3EE3012DE6C017C034895C2C92BC4DE99895C2C924"
	}
	
	Enable = {
		# TODO: when I figure out a way to sensibly support exporting a lot of commands with reasonable semantics,
		#  and or the dependency system, export all the commands from ./app/bin
		#  (currently, the best candidate seems to be to have designated bin dir, which we'll optionally scrape and copy to pkg_bin),
		echo "Nothing to do."
	}
}
