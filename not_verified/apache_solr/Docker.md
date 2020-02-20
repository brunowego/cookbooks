# Docker

## Volume

```sh
docker volume create solr-data
```

## Running

```sh
docker run -d \
  -h solr \
  -v solr-data:/opt/solr/server/solr/mycores \
  -p 8983:8983 \
  --name solr \
  solr:8.0-alpine
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8983'
```
