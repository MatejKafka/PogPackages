@{
	Name = 'Helix'
	Architecture = 'x64'
	Version = '23.05'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/helix-editor/helix/releases/download/${V}/helix-${V}-x86_64-windows.zip"}
		Hash = "27BA9A7EA0CBB5A4DE2378C5D7383405F2AEB254118CFBA1785EB0B32AEE3EF0"
	}

	# FIXME: too much shotgunning with overwriting APPDATA and LOCALAPPDATA, especially since
	#  Helix allows the user to open a shell from the editor
	# TODO: open PRs to add env vars for other paths
	#  https://github.com/helix-editor/helix/blob/master/helix-loader/src/lib.rs#L135
	Enable = {
		Assert-Directory "./data/helix/runtime"
		Assert-Directory "./cache/helix"
		Assert-File "./config/config.toml"

		Export-Command "hx" "./app/hx.exe" `
			-Arguments @("--config", "./config/config.toml") `
			-Environment @{
				"APPDATA" = "./data"
				"LOCALAPPDATA" = "./cache"
			}
	}
}