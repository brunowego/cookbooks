# Docker

## Running

```sh
docker run -d \
  -h wekan-db \
  -v /opt/mongo/data/runtime/db:/data/db \
  -e MONGO_INITDB_ROOT_USERNAME=wekan \
  -e MONGO_INITDB_ROOT_PASSWORD='Pa$$w0rd!' \
  -p 27017:27017 \
  --name wekan-db \
  --restart always \
  mongo:4.0.3
```

<!-- ```sh
docker run -d \
  -h wekan-mail \
  -v /opt/mongo/data/runtime/db:/data/db \
  -p 27017:27017 \
  --name wekan-mail \
  --restart always \
  marvambass/versatile-postfix:latest
``` -->

<!-- --env MAIL_URL=smtp://wekan:wekan@127.0.0.1:25 -->

```sh
docker run -d \
  -h wekan-app \
  -e MONGO_URL='mongodb://wekan:Pa$$w0rd!@wekan-db:27017/wekan' \
  # --env ROOT_URL=http://127.0.0.1:8080 \
  -e PORT=8080 \
  -p 8080:8080 \
  --name wekan-app \
  --restart always \
  wekanteam/wekan:v2.22
```

<!-- MONGO_OPLOG_URL=mongodb://<username>:<password>@<mongoDbURL>/local?authSource=admin&replicaSet=rsWekan -->

## Prune

```sh
sudo rm -fR /opt/mongo/data/runtime/db
```
