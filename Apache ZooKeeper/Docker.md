# Docker

## Running

```sh
docker run -d \
  -h zookeeper \
  -p 2182:2181 \
  --name zookeeper \
  --restart always \
  zookeeper:latest
```
