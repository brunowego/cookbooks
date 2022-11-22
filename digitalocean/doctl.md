# DigitalOcean doctl

## Links

- [Docs](https://docs.digitalocean.com/reference/doctl/)

## CLI

### Installation

#### Homebrew

```sh
brew install doctl
```

### Usage

```sh
# Account
doctl account get
doctl account ratelimit

# Auth
doctl auth init
doctl auth switch

# Compute
doctl compute action
doctl compute cdn
doctl compute certificate
doctl compute domain
doctl compute droplet
doctl compute droplet-action
doctl compute firewall
doctl compute floating-ip
doctl compute floating-ip-action floating IP action commands
doctl compute image
doctl compute image-action
doctl compute load-balancer
doctl compute plugin
doctl compute region
doctl compute size
doctl compute snapshot
doctl compute ssh
doctl compute ssh-key
doctl compute tag
doctl compute volume
doctl compute volume-action

# Projects
doctl projects create
doctl projects delete [id]
doctl projects get [id]
doctl projects list
doctl projects resources
doctl projects update [id]
```
