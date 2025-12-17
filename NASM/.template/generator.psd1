@{
    ListVersions = {
        try {
            $BuildListPage = Invoke-WebRequest "https://www.nasm.us/pub/nasm/releasebuilds/"
        } catch [System.Net.Sockets.SocketException] {
            Write-Warning "NASM generator failed, server refused connection (seems that nasm.us is blocking GitHub): $_"
            return
        }

        $BuildListPage
            | % Links `
            | % href `
            | ? {$_ -ne "/pub/nasm/"} `
            | % TrimEnd / `
            | ? {$_ -ne "2.15rc12"} `
            | ? {[Pog.PackageVersion]$_ -gt "2.12rc6"} # older versions only have 32bit binaries
    }

    Generate = {
        $Url = "https://www.nasm.us/pub/nasm/releasebuilds/$_/win64/nasm-$_-win64.zip"
        return [ordered]@{
            Version = $_
            Url = $Url
            Hash = Get-UrlHash $Url
        }
    }
}