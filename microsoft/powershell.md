# Microsoft PowerShell

<!--
https://app.pluralsight.com/library/courses/powershell-devops-playbook/table-of-contents
-->

## References

- [Code Repository](https://github.com/PowerShell/PowerShell)

## App

### Installation

#### Homebrew

```sh
brew install --cask powershell
```

## CLI

### Commands

```sh
pwsh -Help
```

### Usage

```sh
# Get Version
Get-Host | Select-Object Version

#
Get-ExecutionPolicy
Set-ExecutionPolicy Bypass -Scope Process
```

<!--
PowerShell
-->
