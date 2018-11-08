# Docker

## Running

### All in One

```sh
docker run -d \
  -h jaeger-all-in-one \
  -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
  -p 5775:5775/udp \
  -p 5778:5778 \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 9411:9411 \
  -p 14268:14268 \
  -p 16686:16686 \
  --name jaeger-all-in-one \
  --restart always \
  jaegertracing/all-in-one:1.11.0
```

### Collector

```sh
docker run -d \
  -h jaeger-collector \
  -e SPAN_STORAGE_TYPE=elasticsearch \
  -p 9411:9411 \
  -p 14267:14267 \
  -p 14268:14268 \
  --name jaeger-collector \
  --restart always \
  jaegertracing/jaeger-collector:1.11.0 --es.server-urls=http://elasticsearch:9200
```

### Agent

```sh
docker run -d \
  -h jaeger-agent \
  -p 5775:5775/udp \
  -p 5778:5778 \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  --name jaeger-agent \
  --restart always \
  jaegertracing/jaeger-agent:1.11.0 --collector.host-port=jaeger-collector:14267
```

### Query

```sh
docker run -d \
  -h jaeger-query \
  -e SPAN_STORAGE_TYPE=elasticsearch \
  -p 16686:16686 \
  --name jaeger-query \
  --restart always \
  jaegertracing/jaeger-query:1.11.0 --es.server-urls=http://elasticsearch:9200 --log-level=debug
```

## Web UI

### Linux

```sh
xdg-open "http://$(docker-machine ip):16686"
```

### OS X

```sh
open "http://$(docker-machine ip):16686"
```
