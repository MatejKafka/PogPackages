@{
	Name = "nim-lang"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Description = @"
Nim is a statically typed compiled systems programming language. It combines successful
concepts from mature languages like Python, Ada and Modula. Its design focuses on efficiency,
expressiveness, and elegance (in that order of priority).
"@

	Install = @(
		@{
			Url = {"https://nim-lang.org/download/nim-$($this.Version)_x64.zip"}
			Hash = "{{TEMPLATE:Hash}}"
			SetupScript = {
				# use a fixed mingw path, custom nimblepath and custom compiler cache path
				$Prefix = '# PATCHED OPTIONS FOR POG' + "`n" +`
					'gcc.path = r"$nim\dist\mingw\bin"' + "`n" +`
					'nimblepath="$nim/../data/nimble/pkgs"' + "`n" +`
					'nimcache="$nim/../cache"' + "`n" +`
					"`n"

				# this file configures implicit arguments for the Nim compiler
				$Cfg = cat -Raw "./config/nim.cfg"

				# remove default nimble paths, add custom config
				$Cfg = $Prefix + $Cfg.Replace("nimblepath=", "#nimblepath=")

				Set-Content "./config/nim.cfg" $Cfg
				Write-Information "Patched './config/nim.cfg'."
			}
		}
		@{ # mingw, required by Nim
			Url = "https://nim-lang.org/download/mingw64.7z"
			Hash = "04A535D1E0880364CA9609713744F1A9A36835C4CED834CF435C4DC4ECA2159A"
			Target = "dist/mingw"
		}
	)

	Enable = {
		New-Directory "./config/nim"
		New-Directory "./data/nimble"
		New-Directory "./cache"

		# https://github.com/nim-lang/Nim/blob/873eaa3f65f9ef96f3dc4430e8938d273f04f8e9/compiler/nimconf.nim#L232
		# Nim looks for a user config dir at `%APPDATA%/nim`
		Export-Command "nim" "./app/bin/nim.exe" -Environment @{APPDATA = "./config"}

		# https://github.com/nim-lang/nimble/blob/412af022a44157dd17118432fba825da9f204125/src/nimblepkg/config.nim#L41
		# Nimble looks for a config file at `%APPDATA%/nimble/nimble.ini`
		Export-Command "nimble" "./app/bin/nimble.exe" `
			-Arguments @("--nimbleDir:$(Resolve-Path "./data/nimble")") `
			-Environment @{APPDATA = "./data"}

		# TODO: add other commands
	}
}


