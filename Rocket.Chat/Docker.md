# Docker

## Running

```sh
docker run -d \
  -h mongo \
  -v /opt/mongo/data/runtime/db:/data/db \
  -p 27017:27017 \
  --name mongo \
  --restart always \
  mongo:latest --smallfiles
```

```sh
docker run -d \
  -h rocketchat \
  -v /opt/rocket-chat/uploads:/app/uploads \
  -e MONGO_URL=mongodb://mongo:27017/rocketchat \
  -e PORT=8080 \
  -e ROOT_URL=http://127.0.0.1:8080 \
  --link mongo \
  --name rocketchat \
  --restart always \
  rocket.chat:latest
```
