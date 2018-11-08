# Docker

## Volume

```sh
docker volume create mongo-data
```

## Running

```sh
docker run -d \
  -h mongo \
  -v mongo-data:/data/db \
  -e MONGO_INITDB_ROOT_USERNAME=root \
  -e MONGO_INITDB_ROOT_PASSWORD='Pa$$w0rd!' \
  -p 27017:27017 \
  --name mongo \
  --restart always \
  mongo:4.1
```
