@{
	Name = 'PostgreSQL'
	Architecture = 'x64'
	Version = '16.0-1'

	Install = @{
		Url = {"https://get.enterprisedb.com/postgresql/postgresql-$($this.Version)-windows-x64-binaries.zip"}
		Hash = "057289875516CF039F2D57A07D62BA09BAF30E9984B6C252AE7F9746E2CF549B"
	}

	Enable = {
		Assert-Directory "./data"

		ls ./app/bin -File -Filter *.exe | % {
			$Name = [IO.Path]::GetFileNameWithoutExtension($_)
			Export-Command $Name (Resolve-Path -Relative $_) -ReplaceArgv0 -VcRedist -Environment @{
				PGDATA = "./data"
			}
		}

		# TODO: do we want to encourage package authors to output stuff during installation?
		Write-Information "First steps:"
		Write-Information " 1) Run 'initdb' to create a new database cluster."
		Write-Information " 2) Run 'postgres' to start the actual database."
		Write-Information " 3) Run 'createdb' to create a database."
	}
}