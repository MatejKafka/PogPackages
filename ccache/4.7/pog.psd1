@{
	Name = 'ccache'
	Architecture = 'x64'
	Version = '4.7'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/ccache/ccache/releases/download/v${V}/ccache-${V}-windows-i686.zip"}
		Hash = "EEAD93AA8A0D343B20BC7F0FE01E4D6E0BF12D6B59E11749859F0B6E463E523D"
	}

	Enable = {
		Assert-Directory "./cache"
		# TODO: accept an argument with a list of compilers to replace, create working wrappers for these
		Export-Command "ccache" "./.pog/ccache.cmd"
	}
}
