@{
	Name = "mpv"
	Architecture = "x64"
	Version = "0.34.0"
	
	Install = @{
		Url = {"https://downloads.sourceforge.net/project/mpv-player-windows/release/mpv-$($this.Version)-x86_64.7z"}
		# manually computed, as sourceforge only provides SHA1 and MD5
		Hash = "30FD0FB46D1816AAD9CEDDFA8400C7FB82BA48179A60DAF59F7EBE5386AC0274"
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
