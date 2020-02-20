# Verdaccio

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h verdaccio \
  -v verdaccio-conf:/verdaccio/conf \
  -v verdaccio-storage:/verdaccio/storage \
  -v verdaccio-plugins:/verdaccio/plugins \
  -p 4873:4873 \
  --name verdaccio \
  verdaccio/verdaccio:4.1.x
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:4873'
```

### Remove

```sh
docker rm -f verdaccio
docker volume rm verdaccio-conf verdaccio-storage verdaccio-plugins
```
