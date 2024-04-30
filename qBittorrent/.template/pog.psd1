@{
	Name = "qBittorrent"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = {$V = $this.Version; "https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/" +`
			"qbittorrent-${V}/qbittorrent_${V}_x64_setup.exe"}
		Hash = "{{TEMPLATE:Hash}}"
		UserAgent = "Wget"
		NsisInstaller = $true
	}

	Enable = {
		New-Symlink "./app/profile/qBittorrent/cache"  "./cache"  Directory
		New-Symlink "./app/profile/qBittorrent/config" "./config" Directory
		New-Symlink "./app/profile/qBittorrent/data"   "./data"   Directory
		New-Symlink "./data/logs" "./logs" Directory

		Export-Shortcut "qBittorrent" "./app/qbittorrent.exe"

		# TODO: disable auto-update

		# TODO: open firewall for torrenting (otherwise the install is not really portable,
		#  because it fails after reinstall, as it thinks it already asked for firewall permission)
	}
}
