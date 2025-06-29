@{
    ListVersions = {
        # since 25.06b6, Anki started using a new installer format that's just a thin launcher which downloads
        #  necessary packages; there's not really any way for Pog to unpack the app without running the launcher
        #  https://forums.ankiweb.net/t/new-online-installer-launcher/62745/62
        Get-GitHubRelease ankitects/anki `
            | ? Version -ge "2.1.50" `
            | ? Version -notin "25.06b6", "25.06b7" `
            | Get-GitHubAsset "anki-*-windows-qt6.exe", "anki-*-checksums.txt"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset[0].Url
            Hash = Get-HashFromChecksumFile $_.Asset[1].Url $_.Asset[0].Name
        }
    }
}