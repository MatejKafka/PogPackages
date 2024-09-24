@{
	Name = "Ghidra"
	Architecture = "x64"
	Version = "11.1.2"
	
	Install = @{
		Url = "https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.1.2_build/ghidra_11.1.2_PUBLIC_20240709.zip"
		Hash = "219EC130B901645779948FEEB7CC86F131DD2DA6C36284CF538C3A7F3D44B588"
	}
	
	Enable = {
		New-Directory "./data"
		New-Directory "./cache"
		New-Directory "./cache/tmp"

		# most paths are configured in launch.properties; the only exception is the `java_home.save` file,
		#  which does not respect the settings for some reason; we can override it with XDG_CONFIG_HOME
		New-File "./app/support/launch.properties" `
			{throw "Missing file (should be present by-default): ./app/support/launch.properties"} `
			$this._PatchLaunchProps

		Export-Shortcut "Ghidra" "./app/ghidraRun.bat" -Icon "./app/support/ghidra.ico" -Environment @{XDG_CONFIG_HOME = "./data"}
	}

	# https://github.com/NationalSecurityAgency/ghidra/blob/master/GhidraBuild/LaunchSupport/src/main/java/ghidra/launch/JavaConfig.java
	_LaunchProps = @{
		"application.settingsdir" = "./data"
		"application.cachedir" = "./cache"
		"java.io.tmpdir" = "./cache/tmp"
	}

	_PatchLaunchProps = {
		param($File)

		$Orig = cat -Raw $File
		$Patched = $Orig
		$this._LaunchProps.GetEnumerator() | % {
			$Expected = "VMARGS=-D" + $_.Key + "=" + (Resolve-Path $_.Value)
			$Pattern = [regex]("(\n|^)\s*#?\s*(VMARGS=-D" + [regex]::Escape($_.Key) + "=" + "[^\n]*)(\n|$)")
			$Matches = [array]$Pattern.Matches($Patched)
			# iterate backwards, so that we can patch without breaking indices
			[array]::Reverse($Matches)

			foreach ($m in $Matches) {
				if ($m.Groups[2] -eq $Expected) {
					continue
				}

				# fixup the match
				$Patched = $Patched.Substring(0, $m.Index) `
					+ $m.Groups[1] + $Expected + $m.Groups[3] `
					+ $Patched.Substring($m.Index + $m.Length)
			}

			if (-not $Matches) {
				# the option is missing, append it
				if ($Patched -ne "" -and -not $Patched.EndsWith("`n")) {
					$Patched += "`n"
				}
				$Patched += $Expected + "`n"
			}
		}

		if ($Patched -ne $Orig) {
			$Patched | Set-Content $File -NoNewline
		}
	}
}
