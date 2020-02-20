# Statusfy

**Keywords**: Status page

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h statusfy \
  -p 3000:3000 \
  --name statusfy \
  docker.io/bazzite/statusfy:v0.5.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Remove

```sh
docker rm -f statusfy
```
