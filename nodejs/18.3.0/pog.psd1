# currently, packages are not isolated, so they may write to AppData, $HOME/.config,...
# for example, Bower will happily throw its packages to AppData
# only solution to this would probably be redirecting $HOME and $APPDATA to custom locations,
#  which seems too much like shotgunning it to me

# TODO: do something about this

@{
	Name = "nodejs"
	Architecture = "x64"
	Version = "18.3.0"
	
	Install = @{
		Url = {$V = $this.Version; "https://nodejs.org/dist/v${V}/node-v${V}-win-x64.zip"}
		Hash = "7C38BF820817DEEAFD9242AD56B30EDECB02D694177C7811A89C71D3BDB1C64D"
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
			"Pog: disable update-notifier, at least until configstore is updated to respect a custom config location"
			(& $this._GetNpmrcSettings).GetEnumerator() | % {
				$_.Key + "=" + $_.Value
			}
		} $this._UpdateNpmrc
		
		Export-Command "node" "./.pog/node_wrapper.cmd" -NoSymlink
		Export-Command "npm" "./.pog/npm_wrapper.cmd" -NoSymlink
		Export-Command "npx" "./.pog/npx_wrapper.cmd" -NoSymlink
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
		param($Npmrc)
		
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

# TODO: add nodejs/data/npm to PATH
# TODO: optional dependency - git (allows downloading modules from git repo)
#   - can be set explicitly with `npm config set git <path-to-git.exe>`
