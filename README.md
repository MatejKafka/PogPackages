# Main Pog package repository

This is the main package repository for the [Pog package manager](https://github.com/MatejKafka/Pog). Pog uses this repository by default, you do not need to manually configure it. Package manifests from the latest `main` branch are automatically published at <https://packages.pog.matejkafka.com/>.

## Adding a package

1. Clone this repository.
2. Configure Pog to use the local clone as a repository for testing (only applies to the current PowerShell session): `Set-PogRepository C:\path\to\PogPackages`
3. Add a new package, either by creating the package directory manually or calling `New-PogRepositoryPackage -Type ...`.
4. Edit the package manifest, add a version and test it by installing the package: `pog <PackageName>`
5. If everything works, also consider adding a generator script so that new versions are automatically added to the repository. You can run the generator locally with `Update-PogRepository <PackageName>`. You should let it generate all versions locally to make sure that it works across all published releases.
6. Commit and push your changes, then open a GitHub PR to the main repository.
