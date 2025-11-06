@{
    Name = 'htmltest'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        Export-Command "htmltest" "./app/htmltest.exe" -Symlink
    }
}