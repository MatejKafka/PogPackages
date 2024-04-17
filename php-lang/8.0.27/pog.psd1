# PHP maintainers delete old patch versions and only keep the latest one (probably for security reasons)
# e.g. when 8.0.1 is released, 8.0.0 is removed
@{
	Name = "php-lang"
	Architecture = "x64"
	Version = "8.0.27"

	Install = @{
		Url = {"https://windows.php.net/downloads/releases/php-$($this.Version)-Win32-vs16-x64.zip"}
		Hash = "54D6CC64856268916F7A3DDAAE7D636C9F54DD11B0BAF083218BAF102FE153FA"
	}
	
	Enable = {
		param([switch]$ProductionMode)
	
		Assert-Directory "./config"
		
		# TODO: setup session storage paths
		Assert-File "./config/php.ini" "./app/php.ini-$(if ($ProductionMode) {"production"} else {"development"})"
	
		Export-Command "php" "./app/php.exe" -VcRedist
		Export-Command "php-cgi" "./app/php-cgi.exe" -VcRedist
		Export-Command "phpw" "./app/php-win.exe" -VcRedist
		
		# TODO: when optional dependencies are implemented, detect apache and optionally setup PHP support
	}
}
