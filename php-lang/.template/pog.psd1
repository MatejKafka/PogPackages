# PHP maintainers delete old patch versions and only keep the latest one (probably for security reasons)
# e.g. when 8.0.1 is released, 8.0.0 is removed
@{
	Name = "php-lang"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = {"https://windows.php.net/downloads/releases/php-$($this.Version)-Win32-vs16-x64.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		param([switch]$ProductionMode)

		New-Directory "./config"
		New-File "./data/.php_history"

		# TODO: setup session storage paths
		New-File "./config/php.ini" "./app/php.ini-$(if ($ProductionMode) {"production"} else {"development"})"

		#                                                             PHP_HISTFILE was added in PHP 8.4
		Export-Command "php" "./app/php.exe" -VcRedist -Environment @{PHP_HISTFILE = "./data/.php_history"}
		Export-Command "php-cgi" "./app/php-cgi.exe" -VcRedist
		Export-Command "phpw" "./app/php-win.exe" -VcRedist

		# TODO: when optional dependencies are implemented, detect apache and optionally setup PHP support
	}
}
