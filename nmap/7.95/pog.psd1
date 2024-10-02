@{
	Name = "nmap"
	Architecture = "x86"
	Version = "7.95"
	
	# TODO: requires npcap, figure out how to enforce it
	Install = @{
		# until 7.92, static zips were available, but the latest few versions only have NSIS installers
		Url = {"https://nmap.org/dist/nmap-$($this.Version)-setup.exe"}
		# from https://nmap.org/dist/sigs/
		Hash = "C59B51D15B5965F27DB4C5BBD21793AD6B492C8C751836BA8BD43829D791146E"
		NsisInstaller = $true
	}
	
	Enable = {
		Export-Command "nmap" "./app/nmap.exe" -VcRedist
		Export-Command "ncat" "./app/ncat.exe" -VcRedist
		Export-Command "nc" "./app/ncat.exe" -VcRedist
	}
}
