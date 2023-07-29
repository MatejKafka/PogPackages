@{
	Name = "Ripcord"
	Architecture = "x64"
	Version = "0.4.29"
	
	Install = @{
		Url = {"https://cancel.fm/dl/Ripcord_Win_$($this.Version).zip"}
		Hash = "C7A393AC669D02C16828706521833DF06B690554368049545E47A1420FA8F04F"
	}
	
	Enable = {
		Set-SymlinkedPath "./app/portable_data" "./config" Directory
		
		Assert-File "./config/settings.ini" {
			"[application]"
			"automatic_check_updates=false"
		} {
			$File = $_
			$Changed = $false
			$Section = $null
			$c = Get-Content $File | % {
				if ($_.Trim() -match "^\[(.*)\]$") {
					$Section = $Matches.1
					return $_
				}
				if ($Section -eq "application" -and $_.Trim().StartsWith("automatic_check_updates=")) {
					$Value = $_.Split("=")[1].Trim()
					if ($Value -eq "false") {return $_}
					$Changed = $true
					return "automatic_check_updates=false"
				} else {
					return $_
				}
			}
			if (-not $Changed) {return}
			$c | Set-Content $File
		}
		
		Export-Shortcut "Ripcord" "./app/Ripcord.exe"
	}
}
