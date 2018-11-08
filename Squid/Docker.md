# Docker

## Running

```sh
sudo mkdir -p /opt/squid
```

```sh
sudo tee /opt/squid/squid.conf << EOF

EOF
```

```sh
docker run -d \
  -h squid \
  -v /opt/squid/cache:/var/spool/squid \
  -v /opt/squid/squid.conf:/etc/squid/squid.conf \
  -p 3128:3128 \
  --name squid \
  --restart always \
  sameersbn/squid:latest
```
