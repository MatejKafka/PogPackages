@{
	Name = 'XZ Utils'
	Architecture = 'x64'
	Version = '5.2.7'

	Install = @{
		Url = {"https://tukaani.org/xz/xz-$($this.Version)-windows.7z"}
		Hash = "E9EB1DC1B8BEAA5E3C535FBEAAAB3780869B08FDFEA0AA3AC09A804CC8A84C1A"
		Subdirectory = "bin_x86-64"
	}

	Enable = {
		Export-Command "xz" "./app/xz.exe" -Symlink
		Export-Command "xzdec" "./app/xzdec.exe" -Symlink
		Export-Command "lzmainfo" "./app/lzmainfo.exe" -Symlink
		Export-Command "lzmadec" "./app/lzmadec.exe" -Symlink
	}
}
