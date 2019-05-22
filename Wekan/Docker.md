# Docker

## Volume

```sh
docker volume create wekan-mongo-data
```

## Running

```sh
docker run -d \
  -h mongo.wekan.local \
  -v wekan-mongo-data:/data/db \
  -e MONGO_INITDB_DATABASE=wekan \
  -p 27017:27017 \
  --name wekan-mongo \
  --restart always \
  mongo:4.1
```

```sh
docker run -d \
  -h app.wekan.local \
  -e ROOT_URL=http://0.0.0.0:8080 \
  -e MONGO_URL=mongodb://wekan-mongo:27017/wekan \
  -p 8080:8080 \
  --name wekan-app \
  --restart always \
  --link wekan-mongo \
  wekanteam/wekan:v2.74
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```

## Remove

```sh
docker rm -f wekan-mongo wekan-app
docker volume rm wekan-mongo-data
```
