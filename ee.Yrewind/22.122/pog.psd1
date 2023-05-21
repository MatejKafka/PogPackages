@{
	Name = 'ee.Yrewind'
	Architecture = 'x64'
	Version = '22.122'

	Install = @{
		Url = "https://github.com/rytsikau/ee.Yrewind/releases/download/20221219/ee.yrewind_22.122.zip"
		Hash = "64858B828E1639E401255E9EDE7C6A94D93611066F235496EE76B2CE8478F373"
	}

	Enable = {
		Export-Command "yrewind" "./app/yrewind.exe" -NoSymlink
	}
}
