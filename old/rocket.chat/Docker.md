# Docker

## Volume

```sh
docker volume create rocketchat-mongo-data
docker volume create rocketchat-uploads
```

## Running

```sh
docker run -d \
  -h mongo.rocketchat.local \
  -v rocketchat-mongo-data:/data/db \
  -e MONGO_INITDB_DATABASE=rocketchat \
  -p 27017:27017 \
  --name rocketchat-mongo \
  docker.io/library/mongo:4.0.20 mongod --oplogSize 128 --replSet rs0 --storageEngine wiredTiger
```

```sh
docker run -i --rm \
  docker.io/library/mongo:4.0.20 mongo rocketchat-mongo/rocketchat --eval 'rs.initiate({ _id: "rs0", members: [ { _id: 0, host: "localhost:27017" } ]})'
```

```sh
docker run -d \
  -h rocketchat.local \
  -v rocketchat-uploads:/app/uploads \
  -e PORT=3000 \
  -e ROOT_URL='http://localhost:3000' \
  -e MONGO_URL='mongodb://rocketchat-mongo:27017/rocketchat' \
  -e MONGO_OPLOG_URL='mongodb://rocketchat-mongo:27017/local?replSet=rs0' \
  -p 3000:3000 \
  --name rocketchat \
  rocket.chat:1.0.3
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

## Remove

```sh
docker rm -f rocketchat-mongo rocketchat
docker volume rm rocketchat-mongo-data rocketchat-uploads
```
