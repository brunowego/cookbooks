# Docker

## Volume

```sh
docker volume create example-elasticsearch-config
docker volume create example-elasticsearch-data
docker volume create example-elasticsearch-logs
```

## Running

```sh
docker run -d \
  -h elasticsearch.example.local \
  -e discovery.type=single-node \
  -v example-elasticsearch-config:/usr/share/elasticsearch/config \
  -v example-elasticsearch-data:/usr/share/elasticsearch/data \
  -v example-elasticsearch-logs:/usr/share/elasticsearch/logs \
  -p 9200:9200 \
  -p 9300:9300 \
  --name example-elasticsearch \
  --restart always \
  elasticsearch:7.1.0
```

## Remove

```sh
docker rm -f example-elasticsearch
docker volume rm example-elasticsearch-config example-elasticsearch-data example-elasticsearch-logs
```
