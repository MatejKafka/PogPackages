@{
	Name = 'DrMemory'
	Architecture = 'x64'
	Version = '2.5.19232'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/DynamoRIO/drmemory/releases/download/cronbuild-${V}/DrMemory-Windows-${V}.zip"}
		Hash = "A2366894C5B9C4217795D44147C6F9891B72B1D87A342915584EBDCDABDD0719"
	}

	Enable = {
		New-Directory "./data"
		New-Directory "./cache/symcache"


		$CmdEnv = @{DYNAMORIO_CONFIGDIR = "./data"}

		Export-Command "drmemory" "./app/bin64/drmemory.exe" -ReplaceArgv0 -Environment $CmdEnv `
			-Arguments @("-symcache_dir", "./cache/symcache")
		Export-Command "drltrace" "./app/bin64/drltrace.exe" -ReplaceArgv0 -Environment $CmdEnv `
			-Arguments @("-symcache_dir", "./cache/symcache")
		# TODO: arg handling: https://github.com/DynamoRIO/drmemory/blob/b083b08bffbd78ab49373c829bf6f7d79cdf7a4f/drstrace/drstrace_frontend.c#L643
		Export-Command "drstrace" "./app/bin64/drstrace.exe" -ReplaceArgv0 -Environment $CmdEnv `
			-Arguments @("-symcache_path", "./cache/symcache")
		Export-Command "drconfig" "./app/bin64/drconfig.exe" -ReplaceArgv0 -Environment $CmdEnv `
			-Arguments @("-root", "./app")
		Export-Command "symquery" "./app/bin64/symquery.exe" -ReplaceArgv0 -Environment $CmdEnv

	}
}
