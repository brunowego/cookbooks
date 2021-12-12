# Chocolatey

## CLI

### Installation

1. Find `Windows PowerShell`
2. `Run as administrator`

```PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

### Usage

```sh
# Upgrade
choco upgrade [package]

# Search
choco search [package]

# Install
choco install -y [package]

# Uninstall
choco uninstall [package]

# List
choco list
```
