@{
	Name = 'fq'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Directory "./cache"

		# https://github.com/wader/fq/blob/496849daa57c45d17e85b253bb3e9bc0b42ba9b4/pkg/cli/cli.go#L188
		Export-Command "fq" "./app/fq.exe" -Environment @{LOCALAPPDATA = "./cache"}
	}
}