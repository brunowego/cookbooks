# Docker

## Running

```sh
docker run -d \
  -h prometheus \
  -p 9090:9090 \
  --name prometheus \
  --restart always \
  prom/prometheus:v2.8.1
```
