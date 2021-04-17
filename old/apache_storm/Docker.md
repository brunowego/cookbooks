# Docker

## Volume

```sh
docker volume create storm-data
docker volume create storm-logs
```

## Running

```sh
docker run -d \
  -h storm \
  -v solr-data:/data \
  -v solr-logs:/logs \
  -p 8080:8080 \
  --name storm \
  storm:1.2.2 storm ui
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```
