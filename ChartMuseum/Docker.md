# Docker

## Running

```sh
docker run -d --rm \
  -h chartmuseum \
  -p 8080:8080 \
  -v $(pwd)/charts:/charts \
  -e DEBUG=true \
  -e STORAGE=local \
  -e STORAGE_LOCAL_ROOTDIR=/charts \
  chartmuseum/chartmuseum:v0.8.1
```

## Remove

```sh
docker rm -f zookeeper
```
