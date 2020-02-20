# Docker

## Running

```sh
docker run -d \
  -h logstash \
  -p 5000:5000 \
  -p 9600:9600 \
  --name logstash \
  logstash:7.1.0
```

## Remove

```sh
docker rm -f logstash
```
