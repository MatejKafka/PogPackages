@{
	Name = "speedtest"
	Architecture = "x64"
	Version = "1.0.0"
	
	Install = @{
		Url = {"https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-$($this.Version)-win64.zip"}
		Hash = "64054A021DD7D49E618799A35DDBC618DCFC7B3990E28E513A420741717AC1AD"
	}
	
	Enable = {
		Assert-Directory "./config"
		Export-Command "speedtest" "./.pog/speedtest_wrapper.cmd" -NoSymlink
	}
}
