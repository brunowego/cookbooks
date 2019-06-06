# Rancher

## Docker

### Volume

```sh
docker volume create rancher-data
```

### Running

```sh
docker run -d \
  -h rancher.local \
  -v rancher-data:/var/lib/rancher \
  -p 8080:80 \
  -p 8443:443 \
  --name rancher \
  --restart always \
  rancher/rancher:v2.2.4
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```

## Remove

```sh
docker rm -f rancher
docker volume rm rancher-data
```
