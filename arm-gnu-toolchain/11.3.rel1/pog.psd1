@{
	Name = 'arm-gnu-toolchain'
	Description = 'URL: https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain'
	Architecture = 'x86'
	Version = '11.3.rel1'

	Install = @{
		Url = "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-mingw-w64-i686-arm-none-eabi.zip"
		Hash = "23F24595AA575FBA4FDB0CB086DF4B053862AF60837502CB7E52BD4FB3D76C36"
	}

	Enable = {
		foreach ($c in (ls "./app/bin")) {
			Export-Command $c.BaseName "./app/bin/$($c.Name)"
		}
	}
}
