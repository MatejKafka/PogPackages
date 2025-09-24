@{
    Name = 'Hugo'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Description = "The world's fastest framework for building websites. (extended version)"
    Website = "https://gohugo.io/"

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        Export-Command "hugo" "./app/hugo.exe" -Symlink
    }
}