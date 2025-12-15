@{
    Name = 'NASM'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        Export-Command "nasm" "./app/nasm.exe" -Symlink
        Export-Command "ndisasm" "./app/ndisasm.exe" -Symlink
    }
}