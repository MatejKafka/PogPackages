# currently, packages are not isolated, so they may write to AppData, $HOME/.config,...
# for example, Bower will happily throw its packages to AppData
# only solution to this would probably be redirecting $HOME and $APPDATA to custom locations,
#  which seems too much like shotgunning it to me
# TODO: do something about this

# TODO: add nodejs/data/npm to PATH
# TODO: optional dependency - git (allows downloading modules from git repo)
#   - can be set explicitly with `npm config set git <path-to-git.exe>`

@{
	Name = "nodejs"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = {$V = $this.Version; "https://nodejs.org/dist/v${V}/node-v${V}-win-x64.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		Assert-Directory "./data/node"
		Assert-Directory "./data/npm"
		Assert-Directory "./cache"
		Assert-Directory "./cache/npm"
		Assert-Directory "./cache/node-gyp"
		
		# this is the user-level npmrc file; the global npmrc is in the same directory, but it's called npmrc_global and it's not created by default
		Assert-File "./config/npmrc" {
			"# Pog: disable update-notifier, at least until configstore is updated to respect a custom config location"
			(& $this._GetNpmrcSettings).GetEnumerator() | % {
				$_.Key + "=" + $_.Value
			}
		} $this._UpdateNpmrc
		
		
		$Env = @{
			# set these for all entry points, as they might call each other internally
			NODE_REPL_HISTORY = "./data/node/node_repl_history.txt"
			NPM_CONFIG_USERCONFIG = "./config/npmrc"
			NPM_CONFIG_GLOBALCONFIG = "./config/npmrc_global"
		}

		Export-Command "node" "./app/node.exe" -Environment $Env
		Export-Command "npm" "./app/npm.cmd" -Environment $Env
		Export-Command "npx" "./app/npx.cmd" -Environment $Env
	}
	
	_GetNpmrcSettings = {[ordered]@{
		"update-notifier" = "false"
		# otherwise we get a warning on each invocation
		"scripts-prepend-node-path" = "true"
		prefix = Resolve-Path "./data/npm"
		cache = Resolve-Path "./cache/npm"
		# override dir where node-gyp stores downloaded SDK
		devdir = Resolve-Path "./cache/node-gyp"
	}}
	
	_UpdateNpmrc = {
		$Npmrc = $_
		
		$NpmrcSettings = & $this._GetNpmrcSettings
		$Remaining = [Collections.Generic.HashSet[string]]::new([string[]]$NpmrcSettings.Keys)
		$Changed = $false
		
		$c = Get-Content $Npmrc | % {
			$Key, $Value = $_.Split("=") | % {$_.Trim()}
			if (-not $NpmrcSettings.Contains($Key)) {return $_}
			if ($Key -notin $Remaining) {return}  # ignore
			[void]$Remaining.Remove($Key)
			
			if ($Value -eq $NpmrcSettings[$Key]) {return $_}
			$Changed = $true
			return $Key + "=" + $NpmrcSettings[$Key]
		}
		
		if ($Remaining.Count -eq 0 -and -not $Changed) {
			return
		}
		
		$c += $Remaining | % {
			$_ + "=" + $NpmrcSettings[$_]
		}
		
		$c | Set-Content $Npmrc
	}
}
