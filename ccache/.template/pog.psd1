@{
	Name = 'ccache'
	Architecture = 'x64'
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		New-Directory "./cache"

		# TODO: accept an argument with a list of compilers to replace, create working wrappers for these
		Export-Command "ccache" "./app/ccache.exe" -Environment @{CCACHE_DIR = "./cache"}
	}
}
