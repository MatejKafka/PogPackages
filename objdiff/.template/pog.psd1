@{
    Name = 'objdiff'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @(
        @{
            Url = '{{TEMPLATE:UrlGui}}'
            Hash = '{{TEMPLATE:HashGui}}'
            NoArchive = $true
            Target = "objdiff.exe"
        }
        @{
            Url = '{{TEMPLATE:UrlCli}}'
            Hash = '{{TEMPLATE:HashCli}}'
            NoArchive = $true
            Target = "objdiff-cli.exe"
        }
    )

    Enable = {
        Export-Command "objdiff" "./app/objdiff.exe" -Symlink
        Export-Command "objdiff-cli" "./app/objdiff-cli.exe" -Symlink
    }
}