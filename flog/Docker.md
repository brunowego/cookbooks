# Docker

## Running

```sh
docker run -d \
  -h flog \
  --name flog \
  --restart always \
  mingrammer/flog:latest
```

## Remove

```sh
docker rm -f flog
```
