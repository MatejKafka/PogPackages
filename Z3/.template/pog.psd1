@{
	Name = 'Z3'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://github.com/Z3Prover/z3'
	Description = 'The Z3 Theorem Prover'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "z3" "./app/bin/z3.exe"
	}
}