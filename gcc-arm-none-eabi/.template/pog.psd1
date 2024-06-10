@{
	Name = 'gcc-arm-none-eabi'
	Website = 'https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain'

	Architecture = 'x86'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		foreach ($c in (ls "./app/bin" -Filter *.exe)) {
			Export-Command $c.BaseName "./app/bin/$($c.Name)"
		}
	}
}
