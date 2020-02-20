# whoami

## CLI

### Usage

```sh
whoami
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h whoami \
  -p 80:80 \
  --name whoami \
  docker.io/containous/whoami:v1.4.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1'
```

### Remove

```sh
docker rm -f whoami
```
