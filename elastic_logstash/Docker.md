# Docker

## Running

```sh
docker run -d \
  -h logstash.example.local \
  -p 5000:5000 \
  -p 9600:9600 \
  --name example-logstash \
  --restart always \
  logstash:7.1.0
```

## Remove

```sh
docker rm -f example-logstash
```
