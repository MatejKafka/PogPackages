@{
	Name = "Qalculate"
	Architecture = "x86"
	Version = "3.20.1"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/Qalculate/qalculate-gtk/releases/download/v${V}/qalculate-${V}-i386.zip"}
		Hash = "E82CF15D322C496970752559DD45AFFB7D636B812E95A2DCDE711F8573E12EA9"
	}

	Enable = {
		New-Symlink "./app/user" "./data" Directory

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

		Export-Command qalc "./app/qalc.exe"
		Export-Shortcut "Qalculate (Basic)" "./app/qalculate.exe"
		Export-Shortcut "Qalculate (Console)" "./app/qalculate-qt.exe"
	}
}
