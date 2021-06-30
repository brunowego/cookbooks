# MonitoRSS Clone (a.k.a. Discord.RSS)

## Links

- [Code Repository](https://github.com/synzen/MonitoRSS-Clone)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Dependencies

1. Open [Applications](https://discord.com/developers/applications/)
2. New Application
   - Name: `mrss_docker_token`
   - Create
3. Bot Menu Entry -> Add Bot -> Yes, do it! -> Copy "TOKEN" (put in environment `DISCORD_TOKEN`)
4. OAuth2 Menu Entry -> Copy "CLIENT ID" (put in environment `DISCORD_CLIENT_ID`) and "CLIENT SECRET" (put in environment `DISCORD_CLIENT_SECRET`).

### Running

```sh
#
export DISCORD_TOKEN=''
export DISCORD_REDIRECT_URI='https://example.com/authorize'
export DISCORD_CLIENT_ID=''
export DISCORD_CLIENT_SECRET=''

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongodb \
  -v mrss-mongodb-data:/data/db \
  -v mrss-mongodb-configdb:/data/configdb \
  -e MONGO_INITDB_DATABASE='mrss' \
  -p 27017:27017 \
  --name mrss-mongodb \
  --network workbench \
  docker.io/library/mongo:4.4.6

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h bot \
  -e DRSS_START='bot' \
  -e DRSS_BOT_TOKEN="$DISCORD_TOKEN" \
  -e DRSS_DATABASE_URI='mongodb://mrss-mongodb:27017/mrss' \
  --name mrss-bot \
  --network workbench \
  docker.io/synzen/monitorss:latest

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -v mrss-redis-data:/data \
  -p 6379:6379 \
  --name mrss-redis \
  --network workbench \
  docker.io/library/redis:5.0.5-alpine3.9

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h web \
  -e DRSS_START='web' \
  -e DRSSWEB_BOT_TOKEN="$DISCORD_TOKEN" \
  -e DRSSWEB_DATABASE_REDIS='redis://mrss-redis:6379' \
  -e DRSSWEB_DATABASE_URI='mongodb://mrss-mongodb:27017/mrss' \
  -e DRSSWEB_BOT_REDIRECTURI="$DISCORD_REDIRECT_URI" \
  -e DRSSWEB_BOT_CLIENTID="$DISCORD_CLIENT_ID" \
  -e DRSSWEB_BOT_CLIENTSECRET="$DISCORD_CLIENT_SECRET" \
  -p 8081:8081 \
  --name mrss-web \
  --network workbench \
  docker.io/synzen/monitorss:latest
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8081'
```

### Remove

```sh
docker rm -f \
  mrss-redis \
  mrss-mongodb \
  mrss-bot \
  mrss-web

docker volume rm \
  mrss-redis-data \
  mrss-mongodb-data \
  mrss-mongodb-configdb
```
