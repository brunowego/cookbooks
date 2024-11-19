# Cloudflare Tunnel (formerly Argo Tunnel)

## Links

- [Code Repository](https://github.com/cloudflare/cloudflared)
- Docs
  - [Create a locally-managed tunnel (CLI)](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/get-started/create-local-tunnel/)

## CLI

### Installation

```sh
# Using Hoembrew
brew tap cloudflare/cloudflare
brew install cloudflared
```

### Commands

```sh
cloudflared tunnel -h
```

### Configuration

```sh
#
cloudflared tunnel login
```

### Using

```sh
#
cloudflared tunnel list

#
cloudflared tunnel create <name>
cloudflared tunnel create local

#
cloudflared tunnel route dns <name> <name>.<domain>

#
cloudflared tunnel run <name>

#
cloudflared tunnel route ip list
# cloudflared tunnel route ip add
cloudflared tunnel route ip show

#
cloudflared tunnel info <name>

#
cloudflared tunnel cleanup <name>
cloudflared tunnel delete <name>
```

<!--
cloudflared tunnel --url http://localhost:3000
-->

### Tips

#### TBD

```sh
#
# ~/.cloudflared/config.yml

#
cloudflared tunnel --config ./.cloudflared/config.yml ingress validate
cloudflared tunnel --config ./.cloudflared/config.yml ingress rule https://local-app.<domain>

#
cloudflared tunnel --config ./.cloudflared/config.yml route dns local local-app.<domain>

#
cloudflared tunnel --config ./.cloudflared/config.yml run
```

### Issues

#### TBD

```log
DNS_PROBE_FINISHED_NXDOMAIN
```

<!--
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
-->

<!--
sudo networksetup -setdnsservers "Wi-Fi" 8.8.8.8 8.8.4.4
sudo networksetup -setdnsservers "Wi-Fi" 1.1.1.1 1.0.0.1
sudo networksetup -setdnsservers "Wi-Fi" empty
-->

<!--
sudo ifconfig en0 down && sudo ifconfig en0 up
-->

<!--
Try disconnect the Wi-Fi and reconnect
-->

TODO

## Docker

**Note:** Not tested.

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h cloudflared \
  -e TZ='UTC' \
  -e TUNNEL_DNS_UPSTREAM='https://1.0.0.1/dns-query,https://1.1.1.1/dns-query' \
  -e TUNNEL_DNS_ADDRESS='0.0.0.0' \
  -e TUNNEL_DNS_PORT='5053' \
  --name cloudflared \
  docker.io/cloudflare/cloudflared:latest
```

### Remove

```sh
docker rm -f cloudflared
```
