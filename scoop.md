# Scoop

<!--
https://github.com/Infisical/scoop-infisical
-->

## Links

- [Code Repository](https://github.com/ScoopInstaller/Scoop)
- [Main Website](https://scoop.sh)

## CLI

### Installation

#### Windows

```sh
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# or shorter
iwr -useb get.scoop.sh | iex
```

### Usage

```sh
#
scoop install git

#
scoop bucket add org <git-repo>

#
scoop install <package-name>
```

### Issues

#### Running as Administrator

```log
Running the installer as administrator is disabled by default, see https://github.com/ScoopInstaller/Install#for-admin for details.
```

```sh
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
```
