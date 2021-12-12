# docker-http-https-echo

## Links

- [Code Repository](https://github.com/mendhak/docker-http-https-echo)
- [Main Website](https://code.mendhak.com/docker-http-https-echo/)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

## Running

```sh
docker run -t --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h http-https-echo \
  -p 8080:8080 \
  -p 8443:8443 \
  --name http-https-echo \
  docker.io/mendhak/http-https-echo:18
```
