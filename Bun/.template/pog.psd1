@{
	Name = 'Bun'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-File "./config/.bunfig.toml"
		New-Directory "./cache/transpiler"
		New-Directory "./cache/install"

		Export-Command "bun" "./app/bun.exe" -VcRedist -Environment @{
			BUN_RUNTIME_TRANSPILER_CACHE_PATH = "./cache/transpiler"
			BUN_INSTALL_CACHE_DIR = "./cache/install"
			XDG_CONFIG_HOME = "./config"
			BUN_REPL_NO_HISTORY = "1"
		}
	}
}