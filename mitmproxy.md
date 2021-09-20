# mitmproxy

<!--
https://earthly.dev/blog/mitmproxy/
-->

**Keywords:** HTTPS Proxy, Reverse Proxy

## Links

- [Code Repository](https://github.com/mitmproxy/mitmproxy)
- [Main Website](https://mitmproxy.org/)

## Guides

- [Map Local](https://docs.mitmproxy.org/stable/overview-features/#map-local)
- [Map Remote](https://docs.mitmproxy.org/stable/overview-features/#map-remote)
- [About Certificates](https://docs.mitmproxy.org/stable/concepts-certificates/)

## CLI

### Installation

#### Homebrew

```sh
brew install mitmproxy
```

### Commands

```sh
mitmproxy -h
mitmdump -h
```

### Usage

```sh
#
mitmproxy -p 8080

#
curl \
  --proxy http://127.0.0.1:8080 \
  'http://wttr.in/Dunedin?0'
```

### Tips

#### Map Remote

<!--
mitmproxy \
  -p 8080 \
  --map-remote '|.*\/api/ping|//127.0.0.1:8092/ping' \
  --mode reverse:http://127.0.0.1:8092
-->

```sh
#
mitmproxy \
  -p 8080 \
  --map-remote '|.*\.jpg$|https://placedog.net/640/480?random' \
  --mode reverse:http://127.0.0.1:8000
```

#### Reverse Proxy

```sh
#
mitmproxy \
  -p 8080 \
  --mode reverse:http://127.0.0.1:8000

#
mitmdump \
  -p 443 \
  --mode reverse:http://127.0.0.1:8000

#
mitmdump \
  --listen-host 127.0.0.1 \
  --listen-port 60808 \
  --mode upstream:http://[host_upstream_proxy]:[port_upstream_proxy] \
  --certs <path_to_certs>/hostname.pem \
  --scripts <path_to_scripts>/handler.py \
  --set upstream_cert=false \
  --set ssl_insecure=true \
  --set allow_remote=true -v
```

<!-- ####

```sh
mitmdump \
  --mode reverse:http://127.0.0.1:8000 \
  -w traffic.mitm
``` -->

<!-- ### Issues -->

<!-- ####

```log
Client Handshake failed. The client may not trust the proxy's certificate for ('127.0.0.1', 8000).
```

TODO -->
