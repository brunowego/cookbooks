# Cloudflare

<!--
https://github.com/mrbbot/miniflare
-->

**Keywords:** CDN, DDoS Mitigation

## Links

- [Main Website](https://cloudflare.com)

## Docs

- [Deploy a Next.js site](https://developers.cloudflare.com/pages/framework-guides/deploy-a-nextjs-site)

## CLI

### Installation

#### Homebrew

```sh
brew tap cloudflare/cloudflare
brew install cloudflared
```

### Initialize

```sh
#
cloudflared login
```

<!-- ### Usage -->

<!--
https://developers.cloudflare.com/cloudflare-one/tutorials/share-new-site/
-->

<!-- ```sh
#
cloudflared tunnel create <name>
``` -->

## Docker

**Note:** Not tested.

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h cloudflared \
  -e TZ='America/Sao_Paulo' \
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
