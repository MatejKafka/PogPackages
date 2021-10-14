@{
	Name = "Ghidra"
	Architecture = "x64"
	
	Version = "10.0.3"
	_Hash = "1e1d363c18622b9477bddf0cc172ec55e56cac1416b332a5c53906a78eb87989"
	_Url = "https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.0.3_build/ghidra_10.0.3_PUBLIC_20210908.zip"
	
	Install = {
		Install-FromUrl $this._Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		throw "TODO: redirect $HOME/.ghidra dir"
		
		Assert-Directory "./cache"
		
		Assert-File "./app/support/launch.properties" {
			throw "Missing file (should be present by-default): ./app/support/launch.properties"
		} {
			param($File)
			$Changed = $false
			$Found = $false
			$CachedirLine = "VMARGS=-Dapplication.cachedir=" + (Resolve-Path ./cache)
			$Out = cat $File | % {
				if ($_ -eq "#VMARGS=-Dapplication.cachedir=" -or $_.StartsWith("VMARGS=-Dapplication.cachedir=")) {
					$Found = $true
					if ($_ -eq $CachedirLine) {
						return $_
					}
					$Changed = $true
					return $CachedirLine
				}
				return $_
			}
			if (-not $Found) {
				$Out += $CachedirLine
				$Changed = $true
			}
			if ($Changed) {
				$Out | Out-File $File
			}
		}
	}
}