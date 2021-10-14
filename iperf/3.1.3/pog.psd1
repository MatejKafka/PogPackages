@{
	Name = "iperf"
	Version = "3.1.3"
	Architecture = "x64"

	Install = @{
		Url = {"https://iperf.fr/download/windows/iperf-$($this.Version)-win64.zip"}
		Hash = "3C3DB693C1BDCC902CA9198FC716339373658233B3392FFE3D467F7695762CD1"
	}

	Enable = {
		Export-Command "iperf" "./app/iperf3.exe" -NoSymlink -SetWorkingDirectory
	}
}


