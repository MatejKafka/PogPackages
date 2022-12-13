@{
	Name = "git-delta"
	Architecture = "x64"
	Version = "0.8.3"
	
	Install = @{
		Url = {"https://github.com/dandavison/delta/releases/download/$($this.Version)/delta-$($this.Version)-x86_64-pc-windows-msvc.zip"}
		Hash = "17F28218351FFE9092144D960A376E630A60CD625BED81D35E458D0F8EBE96A0"
	}
	
	Enable = {
		# TODO: missing less.exe, whole delta is mysteriously broken even if less.exe is supplied manually
		Export-Command "delta" "./app/delta.exe"
	}
}
