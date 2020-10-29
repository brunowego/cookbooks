# Grafana Data Source MongoDB

## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t grafana/mongodb-proxy -
FROM docker.io/node:12.4-alpine

WORKDIR /usr/src/mongodb-grafana-master

RUN apk add -q --no-cache -t .build-deps \
    curl==7.64.0-r2 \
    unzip==6.0-r4

RUN wget -O tmp.zip https://github.com/JamesOsgood/mongodb-grafana/archive/master.zip && \
    unzip tmp.zip -d .. && rm tmp.zip && \
    npm install

RUN apk del --purge .build-deps

EXPOSE 3333

CMD ["/usr/local/bin/npm", "run", "server"]

EOF
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongo \
  -v grafana-mongo-data:/data/db \
  -e MONGO_INITDB_DATABASE=wekan \
  -p 27017:27017 \
  --name grafana-mongo \
  docker.io/library/mongo:4.0.20
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongo-proxy \
  -p 3333:3333 \
  --name grafana-mongo-proxy \
  docker.io/grafana/mongodb-proxy:latest
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h grafana \
  -v grafana-config:/etc/grafana \
  -v grafana-data:/var/lib/grafana \
  -p 3000:3000 \
  --name grafana \
  docker.io/grafana/grafana:6.6.0
```

```sh
docker exec -i \
  $(echo "$DOCKER_RUN_OPTS") \
  grafana grafana-cli \
    --pluginUrl https://github.com/JamesOsgood/mongodb-grafana/archive/master.zip \
    plugins install grafana-mongodb-datasource
```

```sh
docker restart grafana
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### Remove

```sh
docker rm -f grafana-mongodb-proxy grafana
docker volume rm grafana-config grafana-data
```
