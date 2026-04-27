@{
	Name = 'cargo-make'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://sagiegurari.github.io/cargo-make/'
	Description = 'Rust task runner and build tool.'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-File "./config/config.toml"

		# cargo-make will show a pretty bizzare error when invoked directly, does not have anything to do with Pog:
		# `cliparser::types::ParserError` error. InvalidCommandLine("Command does not match spec, command line: ...`
		"cargo-make", "makers" | % {
			Export-Command $_ "./app/$_.exe" -Environment @{CARGO_MAKE_HOME = "./config"}
		}
	}
}