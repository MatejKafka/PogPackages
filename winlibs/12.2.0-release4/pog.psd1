@{
	Name = 'winlibs'
	Architecture = 'x64'
	Version = '12.2.0-release4'

	Install = @{
		Url = "https://github.com/brechtsanders/winlibs_mingw/releases/download/12.2.0-15.0.7-10.0.0-ucrt-r4/winlibs-x86_64-posix-seh-gcc-12.2.0-mingw-w64ucrt-10.0.0-r4.7z"
		Hash = "B6FCCCB8B9B4F2889A404A41832DD4E5FF6BEC0B5C529D0567FF915132BC400A"
	}

	Enable = {
		# TODO: when I figure out a way to sensibly support exporting a lot of commands with reasonable semantics,
		#  and or the dependency system, export all the commands from ./app/bin
		#  (currently, the best candidate seems to be to have designated bin dir, which we'll optionally scrape and copy to pkg_bin),
		Write-Information "Nothing to do."
	}
}
