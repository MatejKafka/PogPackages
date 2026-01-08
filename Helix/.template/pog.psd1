@{
	Name = 'Helix'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	# FIXME: too much shotgunning with overwriting APPDATA and LOCALAPPDATA, especially since
	#  Helix allows the user to open a shell from the editor
	# TODO: open PRs to add env vars for other paths
	#  https://github.com/helix-editor/helix/blob/master/helix-loader/src/lib.rs#L135
	Enable = {
		New-Directory "./data/helix/runtime"
		New-Directory "./cache/helix"
		New-File "./config/config.toml"

		Export-Command "hx" "./app/hx.exe" -VcRedist `
			-Arguments @("--config", "./config/config.toml") `
			-Environment @{
				"APPDATA" = "./data"
				"LOCALAPPDATA" = "./cache"
			}
	}
}