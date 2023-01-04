# Selenium Grid

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h selenium \
  -p 4444:4444 \
  -p 5900:5900 \
  --name selenium \
  --network workbench \
  docker.io/selenium/standalone-firefox:4.0.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:4444'
```

### Shell

```sh
docker exec -it selenium /bin/bash
```

### Remove

```sh
docker rm -f selenium
```
