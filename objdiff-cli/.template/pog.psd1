@{
    # objdiff GUI is not portable, so this is a CLI-only package
    Name = 'objdiff-cli'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
        NoArchive = $true
        Target = "objdiff-cli.exe"
    }

    Enable = {
        Export-Command "objdiff-cli" "./app/objdiff-cli.exe" -Symlink
    }
}