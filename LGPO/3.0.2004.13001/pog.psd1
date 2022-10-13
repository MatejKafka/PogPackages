@{
	Name = 'LGPO'
	Description = @'
Local Group Policy Object Utility, from Microsoft Security Compliance Toolkit 1.0.
URL: https://docs.microsoft.com/en-us/archive/blogs/secguide/lgpo-exe-local-group-policy-object-utility-v1-0
'@

	Architecture = 'x86'
	Version = '3.0.2004.13001'

	Install = @{
		Url = "https://download.microsoft.com/download/8/5/C/85C25433-A1B0-4FFA-9429-7E023E7DA8D8/LGPO.zip"
		Hash = "CB7159D134A0A1E7B1ED2ADA9A3CE8CE8F4DE391D14403D55438AF824247CC55"
	}

	Enable = {
		Export-Command "LGPO" "./app/LGPO.exe" -Symlink
	}
}
