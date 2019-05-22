# Docker

## Running

```sh
docker run -d \
  -h logstash \
  -p 5000:5000 \
  -p 9600:9600 \
  --name logstash \
  --restart always \
  logstash:latest
```

## Remove

```sh
docker rm -f logstash
```
