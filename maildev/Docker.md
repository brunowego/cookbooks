# Docker

## Running

```sh
docker run -d \
  -h maildev \
  -p 1025:25 \
  -p 1080:80 \
  --name maildev \
  --restart always \
  djfarrelly/maildev:1.0.0
```

## Remove

```sh
docker rm -f maildev
```
