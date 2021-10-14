@{
	Name = "perl-strawberry"
	Architecture = "x64"
	
	Version = "5.32.1.1"
	_Hash = "692646105B0F5E058198A852DC52A48F1CEBCAF676D63BBDEAE12F4EAEE9BF5C"
	
	Install = {
		$Version = $this.Version
		$Url = "https://strawberryperl.com/download/${Version}/strawberry-perl-${Version}-64bit-portable.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		# TODO: finish me
		Export-Command "perl" "./app/perl/bin/perl.exe" -NoSymlink
	}
}