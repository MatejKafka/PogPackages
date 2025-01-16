@{
	Name = 'YAFU (avx512-ifma)'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'
	_Commit = '{{TEMPLATE:Commit}}'

	Website = "https://github.com/bbuhrow/yafu"
	Description = @'
YAFU (with assistance from other free software) uses the most powerful modern
algorithms (and implementations of them) to factor input integers in a
completely automated way.  The automation within YAFU is state-of-the-art,
combining factorization algorithms in an intelligent and adaptive methodology
that minimizes the time to find the factors of arbitrary input integers.
'@

	Install = @(
		@{
			# YAFU is not versioned, binaries are stored directly in the repo
			Url = {"https://github.com/bbuhrow/yafu/raw/$($this._Commit)/yafu-x64-intel-avx512-ifma.exe"}
			Hash = '{{TEMPLATE:Hash}}'
			NoArchive = $true
			Target = "yafu-x64-intel-avx512-ifma.exe"
		}
		@{
			Url = {"https://github.com/bbuhrow/yafu/raw/$($this._Commit)/yafu.ini"}
			Hash = '{{TEMPLATE:HashIni}}'
			NoArchive = $true
			Target = "yafu-default.ini"
		}
	)

	Enable = {
		New-Directory "./data"
		New-File "./data/yafu.ini" "./app/yafu-default.ini"

		# TODO: we could also automatically download the sieves (see README)

		# YAFU stores data in current working directory
		Export-Command "yafu" "./app/yafu-x64-intel-avx512-ifma.exe" -WorkingDirectory "./data"
		Export-Command "yafu-x64-intel-avx512-ifma" "./app/yafu-x64-intel-avx512-ifma.exe" -WorkingDirectory "./data"
	}
}