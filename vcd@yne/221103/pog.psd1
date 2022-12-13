@{
	Name = 'vcd@yne'
	Architecture = 'x64'
	Version = '221103'

	Install = @{
		Url = {"https://github.com/yne/vcd/releases/download/$($this.Version)/vcd-windows-latest-clang.exe"}
		Hash = "365C6D0F2000C7ACFC32BD28FA876ECD05A7201C4EF47F80A076B25EC76DA547"
		NoArchive = $true
	}

	Enable = {
		Export-Command "vcd" "./app/vcd-windows-latest-clang.exe" -Symlink
	}
}
