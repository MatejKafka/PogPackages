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
        # TODO: Hugo creates a cache dir at ~/AppData/Local/hugo_cache, we can override it with HUGO_CACHEDIR, but it seems to be
        #  intended to be overriden and if some types of CI are detected, the location changes; probably wait until recessive
        #  env vars are available in Pog
        Export-Command "hugo" "./app/hugo.exe" -Symlink
    }
}