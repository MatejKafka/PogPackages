@{
    Name = 'yq'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
        NoArchive = $true
        Target = "yq.exe"
    }

    Enable = {
        Export-Command "yq" "./app/yq.exe" -Symlink
    }
}