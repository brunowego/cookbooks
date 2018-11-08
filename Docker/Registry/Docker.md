# Docker

## Configuration

```sh
sudo mkdir -p /etc/docker/registry
```

```sh
docker run -it --rm --entrypoint cat registry:2.7.1 /etc/docker/registry/config.yml | sudo tee /etc/docker/registry/config.yml
```

### Proxy

```sh
sudo tee -a /etc/docker/registry/config.yml << EOF
proxy:
  remoteurl: https://registry-1.docker.io
EOF
```

## Running

```sh
sudo mkdir -p /mnt/registry
```

```sh
docker run -d \
  -h registry \
  --name docker-mirror \
  --restart unless-stopped \
  -p 5000:5000 \
  -v /mnt/registry:/var/lib/registry \
  -v /etc/docker/registry/config.yml:/etc/docker/registry/config.yml \
  registry:2.7.1
```

## Test

```sh
curl -I 127.0.0.1:5000
```
