# Docker

## Running

```sh
docker run -d \
  -h elasticsearch \
  -p 9200:9200 \
  -p 9300:9300 \
  --name elasticsearch \
  --restart always \
  elasticsearch:latest
```

## Remove

```sh
docker rm -f elasticsearch
```
