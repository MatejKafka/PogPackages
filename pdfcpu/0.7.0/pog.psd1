@{
	Name = 'pdfcpu'
	Architecture = 'x64'
	Version = '0.7.0'

	Install = @{
		Url = {"https://github.com/pdfcpu/pdfcpu/releases/download/v$($this.Version)/pdfcpu_$($this.Version)_Windows_x86_64.zip"}
		Hash = "0BADEBCF10EC1E88F4A3ACD1F08B80B746CFF02306E1A387CFC363C933B5670F"
	}

	Enable = {
		Assert-Directory "./config"

		Export-Command "pdfcpu" "./app/pdfcpu.exe" -Environment @{APPDATA = "./config"}
	}
}