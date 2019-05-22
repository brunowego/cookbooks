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
  --restart always \
  mongo:4.1
```

```sh
docker run -d \
  -h app.rocketchat.local \
  -v rocketchat-uploads:/app/uploads \
  -e MONGO_URL=mongodb://rocketchat-mongo:27017/rocketchat \
  -p 3000:3000 \
  --name rocketchat-app \
  --restart always \
  --link rocketchat-mongo \
  rocket.chat:1.0.3
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):3000"
```

## Remove

```sh
docker rm -f rocketchat-mongo rocketchat-app
docker volume rm rocketchat-mongo-data rocketchat-uploads
```
