# Docker

## Running

```sh
docker run -d \
  -h grafana \
  -p 3000:3000 \
  --name grafana \
  --restart always \
  grafana/grafana:5.3.0-beta2
```

## Remove

```sh
docker rm -f grafana
```
