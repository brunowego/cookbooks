# Verdaccio

## Docker

### Volume

```sh
docker volume create verdaccio-conf
docker volume create verdaccio-storage
docker volume create verdaccio-plugins
```

### Running

```sh
docker run -d \
  -h verdaccio \
  -v verdaccio-conf:/verdaccio/conf \
  -v verdaccio-storage:/verdaccio/storage \
  -v verdaccio-plugins:/verdaccio/plugins \
  -p 4873:4873 \
  --name verdaccio \
  --restart always \
  verdaccio/verdaccio:4.1.x
```

### Remove

```sh
docker rm -f verdaccio
docker volume rm verdaccio-conf verdaccio-storage verdaccio-plugins
```
