# Elasticsearch

<!--
https://www.linkedin.com/learning/learning-the-elastic-stack-2/start-listening-to-your-infrastructure
-->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h elasticsearch \
  -e discovery.type=single-node \
  -v elasticsearch-config:/usr/share/elasticsearch/config \
  -v elasticsearch-data:/usr/share/elasticsearch/data \
  -v elasticsearch-logs:/usr/share/elasticsearch/logs \
  -p 9200:9200 \
  -p 9300:9300 \
  --name elasticsearch \
  --network workbench \
  docker.io/library/elasticsearch:7.5.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9200'
```

### Remove

```sh
docker rm -f elasticsearch
docker volume rm elasticsearch-config elasticsearch-data elasticsearch-logs
```
