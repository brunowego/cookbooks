# Docker

## Volume

```sh
docker volume create example-elasticsearch-config
docker volume create example-elasticsearch-data
docker volume create example-elasticsearch-logs
docker volume create example-kibana-config
docker volume create example-kibana-data
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

```sh
docker run -d \
  -h kibana.example.local \
  -e ELASTICSEARCH_HOSTS=http://example-elasticsearch:9200 \
  -v example-kibana-config:/usr/share/kibana/config \
  -v example-kibana-data:/usr/share/kibana/data \
  -p 5601:5601 \
  --name example-kibana \
  --restart always \
  --link example-elasticsearch \
  kibana:7.1.0
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):5601"
```

## Remove

```sh
docker rm -f example-elasticsearch example-kibana
docker volume rm example-elasticsearch-config example-elasticsearch-data example-elasticsearch-logs example-kibana-config example-kibana-data
```
