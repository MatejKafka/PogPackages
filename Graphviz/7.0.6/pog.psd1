@{
	Name = 'Graphviz'
	Architecture = @('x86', 'x64')
	Version = '7.0.6'

	Install = @{
		Url = {$V = $this.Version; "https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/${V}/windows_10_msbuild_Release_graphviz-${V}-win32.zip"}
		Hash = "D52CB2BBB5DC808339DA05DCC0F844CF8C882FBECF2430F94E090DADD5086DDF"
		Subdirectory = "Graphviz/bin"
	}

	Enable = {
		ls ./app/*.exe -File | % {
			Export-Command ([IO.Path]::GetFileNameWithoutExtension($_)) (Resolve-Path -Relative $_) -VcRedist
		}
	}
}
