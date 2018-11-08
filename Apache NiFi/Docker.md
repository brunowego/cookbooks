# Docker

## Running

```sh
docker run -d \
  -h nifi \
  -p 8080:8080 \
  --name nifi \
  --restart always \
  apache/nifi:latest
```
