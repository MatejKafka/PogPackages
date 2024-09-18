@{
	Name = 'Z3'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/Z3Prover/z3/releases/download/z3-${V}/z3-${V}-x64-win.zip"}
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "z3" "./app/bin/z3.exe"
	}
}