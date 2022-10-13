@{
	Name = 'DrMemory'
	Architecture = 'x64'
	Version = '2.5.19232'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/DynamoRIO/drmemory/releases/download/cronbuild-${V}/DrMemory-Windows-${V}.zip"}
		Hash = "A2366894C5B9C4217795D44147C6F9891B72B1D87A342915584EBDCDABDD0719"
	}

	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./cache/symcache"
		Assert-Directory "./logs"

		Export-Command "drmemory" "./.pog/drmemory.cmd" -NoSymlink
		Export-Command "drltrace" "./.pog/drltrace.cmd" -NoSymlink
		Export-Command "drstrace" "./.pog/drstrace.cmd" -NoSymlink
		Export-Command "drconfig" "./.pog/drconfig.cmd" -NoSymlink
		Export-Command "symquery" "./.pog/symquery.cmd" -NoSymlink
	}
}
