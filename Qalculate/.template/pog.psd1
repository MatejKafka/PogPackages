@{
	Name = 'Qalculate'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = "https://qalculate.github.io/"
	Description = "Qalculate! is a multi-purpose cross-platform desktop calculator."

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		# disable version check, which shows a popup whenever a new version is released
		"./data/qalculate-gtk.cfg", "./data/qalculate-qt.cfg" | % {
			New-File $_ {"[General]`ncheck_version=0`n"} {
				$Orig = cat -Raw $_
				$New = $Orig -replace "`ncheck_version=\d(`r?`n)", "`ncheck_version=0`$1"
				if ($New -ne $Orig) {
					Set-Content $_ $New -NoNewline
				}
			}
		}

		$Env = @{QALCULATE_USER_DIR = "./data"}
		$GtkName = if ([Pog.PackageVersion]$this.Version -ge "4.2.0") {"qalculate-gtk.exe"} else {"qalculate.exe"}

		Export-Command qalc "./app/qalc.exe" -Environment $Env
		Export-Shortcut "Qalculate (Basic)" "./app/$GtkName" -Environment $Env
		Export-Shortcut "Qalculate (Console)" "./app/qalculate-qt.exe" -Environment $Env
	}
}
