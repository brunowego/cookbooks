# Cloudflare

<!--
cf_clearance
-->

<!--
https://blog.turso.tech/create-a-distributed-api-for-your-e-commerce-store-using-cloudflare-and-turso-fa449c932240

https://github.com/mrbbot/miniflare

https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/cloudflare.md
-->

**Keywords:** CDN, DDoS Mitigation

## Links

- [Main Website](https://cloudflare.com)
- [Dashboard](https://dash.cloudflare.com)

## Docs

- [Deploy a Next.js site](https://developers.cloudflare.com/pages/framework-guides/deploy-a-nextjs-site)

## Services

- Cloudflare AI
- Cloudflare Browser Rendering
- [Cloudflare D1](./d1.md)
- Cloudflare KV
- [Cloudflare Pages](./pages.md)
- Cloudflare Queues
- [Cloudflare R2](./r2.md)
- Cloudflare Vectorize
- [Cloudflare Workers](./workers.md)

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
