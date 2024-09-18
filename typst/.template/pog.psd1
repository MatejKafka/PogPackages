@{
	Name = 'typst'
	Architecture = 'x64'
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		$V = [Pog.PackageVersion]$this.Version
		$Environment = $null

		if ($V -gt "0.11.1") {
			New-Directory "./data/packages"
			New-Directory "./cache/packages"
			$Environment = @{
				# cache for automatically downloaded packages
				TYPST_PACKAGE_CACHE_PATH = "./cache/packages"
				# custom path to local packages
				TYPST_PACKAGE_PATH = "./data/packages"
			}
		} elseif ($V -ge "0.6.0") {
			Write-Warning "Typst stores cached 3rd party packages in 'AppData/Local/typst' until v0.11.1."
		}

		Export-Command typst "./app/typst.exe" -VcRedist -Environment $Environment
	}
}
