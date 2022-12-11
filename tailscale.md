# Tailscale

<!--
https://artifacthub.io/packages/helm/gabe565/headscale
-->

**Keywords:** Zero Config VPN, WireGuard

## Links

- [Code Repository](https://github.com/tailscale/tailscale)
- [Main Website](https://tailscale.com/)

## Console

- [Machines](https://login.tailscale.com/admin/machines)

## App

### Installation

#### MAS

```sh
mas install 1475387142
```

## CLI

**WIP:** Currently not working as expected.

### Installation

#### Homebrew

```sh
brew install tailscale
```

### Commands

```sh
tailscale -h
```

### Services

```sh
# Homebrew
brew services start tailscale
```

### Bootstrap

```sh
#
tailscale login
```

### Issues

#### Service Error

```log
tailscale error  256 <username> ~/Library/LaunchAgents/homebrew.mxcl.tailscale.plist
```

```sh
# Homebrew
cat /usr/local/var/log/tailscaled.log
```

#### TBD

```log
tailscaled requires root; use sudo tailscaled (or use --tun=userspace-networking)
```

TODO
