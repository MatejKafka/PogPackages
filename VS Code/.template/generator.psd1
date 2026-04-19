@{
    ListVersions = {
        Get-GitHubRelease microsoft/vscode `
        | ? Version -ne "1.110" <# entry missing on update.code.visualstudio.com #> `
        | ? TagName -ne "v0.44.1" <# accidentally published copilot chat release #> `
        | % TagName
    }

    Generate = {
        $Hash = irm "https://update.code.visualstudio.com/api/versions/$_/win32-x64-archive/stable" | % sha256hash
        if (-not $Hash) {
            throw "Could not find archive hash for 'VS Code', version '$_'..."
        }

        return [ordered]@{
            Version = $_
            Hash = $Hash
        }
    }
}