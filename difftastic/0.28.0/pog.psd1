@{
	Name = 'difftastic'
	Architecture = 'x64'
	Version = '0.28.0'
	
	Install = @{
		Url = {"https://github.com/Wilfred/difftastic/releases/download/$($this.Version)/difft-x86_64-pc-windows-msvc.zip"}
		Hash = "5C911BDBC0B35CC00CE671FD62EAB57A419561F33D5C94018CC2BDF989127C73"
	}
	
	Enable = {
		Export-Command "difft" "./app/difft.exe" -Symlink
	}
}
