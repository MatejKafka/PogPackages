@{
    Name = 'immich-go'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        New-Directory "./logs"

        Export-Command "immich-go" "./app/immich-go.exe" `
            -Arguments "--log-file", "./logs/immich-go.log" <# # IMMICH_GO_LOG_FILE doesn't seem to work, use --log-file instead #> `
            -Environment @{IMMICHGO_TEMPDIR = "%TEMP%"} <# defaults to ~/AppData/Local/immich-go #>
    }
}