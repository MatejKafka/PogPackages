@{
	Name = 'rust-analyzer'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
		Subdirectory = "rust-analyzer.exe"
	}

	Enable = {
		Export-Command "rust-analyzer" "./app/rust-analyzer.exe" -Symlink
	}
}