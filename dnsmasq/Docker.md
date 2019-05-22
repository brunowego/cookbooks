# Docker

## Running

```sh
docker run -d \
  -h dnsmasq \
  -e HTTP_USER=admin \
  -e HTTP_PASS=admin \
  -p 53:53/udp \
  -p 8080:8080 \
  --name dnsmasq \
  --restart always \
  jpillora/dnsmasq:1.1.0
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```

## Remove

```sh
docker rm -f dnsmasq
```
