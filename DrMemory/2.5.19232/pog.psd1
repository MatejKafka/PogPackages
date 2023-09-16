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


		$CmdEnv = @{DYNAMORIO_CONFIGDIR = "./data"}
		$CmdArgs = @("-logdir", "./logs", "-symcache_dir", "./cache/symcache")
		
		Export-Command "drmemory" "./app/bin64/drmemory.exe" -Environment $CmdEnv -Arguments $CmdArgs
		Export-Command "drltrace" "./app/bin64/drltrace.exe" -Environment $CmdEnv -Arguments $CmdArgs
		Export-Command "drstrace" "./app/bin64/drstrace.exe" -Environment $CmdEnv -Arguments $CmdArgs
		Export-Command "drconfig" "./app/bin64/drconfig.exe" -Environment $CmdEnv
		Export-Command "symquery" "./app/bin64/symquery.exe" -Environment $CmdEnv
	}
}
