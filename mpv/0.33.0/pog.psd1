@{
	Name = "mpv"
	Architecture = "x64"
	Version = "0.33.0"
	
	Install = @{
		Url = {"https://downloads.sourceforge.net/project/mpv-player-windows/release/mpv-$($this.Version)-x86_64.7z"}
		# manually computed, as sourceforge only provides SHA1 and MD5
		Hash = "16692460C289B93AC3F8EE515E8B2042EE5245CC66A3F05FFF3A238A62D3F1FF"
		# use wget UA, otherwise we are redirected to a HTML page, as sourceforge thinks we're an interactive browser
		UserAgent = "Wget"
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache/watch_later"
		Assert-Directory "./logs"
		
		Export-Command "mpv" "./.pog/mpv_cmd_wrapper.cmd" -NoSymlink
		Export-Shortcut "MPV Player" "./.pog/mpv_lnk_wrapper.cmd" -Icon "./app/mpv.exe"
	}
}
