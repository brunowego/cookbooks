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
export TUNNEL_NAME='<tunnel-name>'

#
cloudflared tunnel create "$TUNNEL_NAME"

#
export TUNNEL_ID='<tunnel-uuid>'
export DOMAIN='<domain>'

#
cloudflared tunnel info "$TUNNEL_ID"

#
cat << YAML > ~/.cloudflared/config.yml
tunnel: $TUNNEL_NAME
credentials-file: $HOME/.cloudflared/$TUNNEL_ID.json

ingress:
  - hostname: local.$DOMAIN
    service: http://localhost:3001
  - service: http_status:404
YAML

#
cat ~/.cloudflared/config.yml

#
cloudflared tunnel ingress validate
cloudflared tunnel ingress rule https://local.$DOMAIN

#
cloudflared tunnel run "$TUNNEL_NAME"

#
cloudflared tunnel route dns "$TUNNEL_NAME" "local.$DOMAIN"

#
cloudflared tunnel cleanup <tunnel-name>
cloudflared tunnel delete <tunnel-name>
```

<!--
#
cloudflared tunnel route ip list
# cloudflared tunnel route ip add
cloudflared tunnel route ip show
-->

<!--
cloudflared tunnel --url http://localhost:3000
-->

### Tips

<!-- #### TBD

```sh
#
ls ~/.cloudflared

#
cloudflared tunnel --config ~/.cloudflared/config.yml ingress validate
cloudflared tunnel --config ~/.cloudflared/config.yml ingress rule https://local-app.<domain>

#
cloudflared tunnel --config ./.cloudflared/config.yml route dns local local-app.<domain>

#
cloudflared tunnel --config ./.cloudflared/config.yml run
``` -->

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
