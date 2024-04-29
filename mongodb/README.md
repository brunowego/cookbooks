# MongoDB

<!--
27017 -> 27018
-->

## Links

- [Code Repository](https://github.com/mongodb/mongo)
- [Docs](https://mongodb.com/docs)
  - [Connection Strings](https://mongodb.com/docs/manual/reference/connection-string/)

## References

- [MongoDB ObjectId ↔ Timestamp Converter](https://steveridout.github.io/mongo-object-time/)

## Tools

- [MongoDB Compass](./compass.md) 🌟
- [Robo 3T (formerly Robomongo)](/robomongo.md)

## Docker

### Links

- [Code Repository](https://github.com/docker-library/mongo)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
# Without User and Password
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongodb \
  -v mongodb-data:/data/db \
  -v mongodb-configdb:/data/configdb \
  -e MONGO_INITDB_DATABASE='dev' \
  -p 27017:27017 \
  --name mongodb \
  --network workbench \
  docker.io/library/mongo:7.0.5

# With User and Password
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongodb \
  -v mongodb-data:/data/db \
  -v mongodb-configdb:/data/configdb \
  -e MONGO_INITDB_ROOT_USERNAME='root' \
  -e MONGO_INITDB_ROOT_PASSWORD='root' \
  -e MONGO_INITDB_DATABASE='dev' \
  -p 27017:27017 \
  --name mongodb \
  --network workbench \
  docker.io/library/mongo:7.0.5

# With Replica Set
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongodb \
  -v mongodb-data:/data/db \
  -v mongodb-configdb:/data/configdb \
  -p 27017:27017 \
  --name mongodb \
  --network workbench \
  docker.io/library/mongo:7.0.5 mongod --replSet rs0

docker exec mongodb mongosh --eval 'rs.initiate({_id: "rs0", members: [{_id: 0, host: "localhost:27017"}]})'
```

<!--
MONGODB_URI=mongodb+srv://root:root@127.0.0.1:27017/dev

DATABASE_URL=mongodb+srv://dev:dev@127.0.0.1/dev
DATABASE_URL=mongodb://root:root@127.0.0.1:27017/dev?authSource=admin&replicaSet=rs0

readPreference=primary
ssl=false
-->

### Client

```sh
docker run -it --rm \
  docker.io/library/mongo:7.0.5 mongo -h
```

### Issues

#### TBD

```log
BadValue: security.keyFile is required when authorization is enabled with replica sets
```

TODO

### Remove

```sh
docker rm -f mongodb

docker volume rm \
  mongodb-data \
  mongodb-configdb
```

## Docker Compose

### Manifest

**Refer:** `./docker-compose.yml`

```yml
---
version: '3'

services:
  mongodb:
    image: docker.io/library/mongo:7.0.5
    volumes:
      - type: volume
        source: mongodb-data
        target: /data/db
      - type: volume
        source: mongodb-configdb
        target: /data/configdb
    environment:
      MONGO_INITDB_ROOT_USERNAME:
      MONGO_INITDB_ROOT_PASSWORD:
      MONGO_INITDB_DATABASE:
    command: --storageEngine=wiredTiger
    ports:
      - target: 27017
        published: $MONGODB_PORT
        protocol: tcp
    restart: unless-stopped

volumes:
  mongodb-data:
    driver: local
  mongodb-configdb:
    driver: local
```

**Refer:** `./.env`

```env
COMPOSE_PROJECT_NAME=acme

MONGODB_HOST=localhost
MONGODB_PORT=27017
MONGO_INITDB_ROOT_USERNAME=acme
MONGO_INITDB_ROOT_PASSWORD=acme
MONGO_INITDB_DATABASE=acme
```

<!--
mongodb://acme:acme@localhost/acme
-->

## CLI

### Installation

#### Homebrew

```sh
brew install mongodb/brew/mongodb-community
```

### Service

#### Homebrew

```sh
brew services start mongodb-community
```

### Commands

```sh
mongo -h
```

### Usage

```sh
# Database Authentication
mongo \
  --host <hostname> \
  --port 27017 \
  -u <username> \
  -p <password> \
  --authenticationDatabase <db-name>

#
mongo topic --eval 'rs.status()'

# mongo topic \
#   -u root \
#   -p root \
#   --eval 'db.createCollection("news")'

# Evaluate
mongo --eval 'printjson(db.serverStatus())'

#
mongo admin --eval "db.shutdownServer()"

# Heredoc
mongo <db-name> <<-EOSQL
[commands]
EOSQL
```

## Helm

### References

- [Parameters](https://github.com/bitnami/charts/tree/main/bitnami/mongodb#parameters)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns mongodb

#
kubens mongodb

#
helm search repo -l bitnami/mongodb

#
helm install mongo bitnami/mongodb \
  --version 13.6.4 \
  -f <(cat << EOF
auth:
  rootPassword: root
EOF
)
```

### Secrets

```sh
kubectl get secret mongo-mongodb \
  -o jsonpath='{.data.mongodb-root-password}' | \
    base64 -d; echo
```

### Port Forward

```sh
kubectl port-forward svc/mongo-mongodb 27017:27017
```

### Delete

```sh
helm uninstall mongo

kubectl delete ns mongodb \
  --grace-period=0 \
  --force
```

## Issues

### TBD

```log
Server selection timeout: No available servers. Topology: { Type: Unknown, Servers: [ { Address: localhost:27017, Type: Unknown, Error: Connection refused (os error 61) }, ] }
```

TODO

### Missing Auth Source Admin

```log
SCRAM failure: Authentication failed.
```

Add `?authSource=admin` to `DATABASE_URL`.

<!--
mongodb://dev:dev@localhost/dev?authSource=admin
-->

### TBD

```log
BadValue: security.keyFile is required when authorization is enabled with replica sets
```

TODO

### Missing Mechanism and Source

```log
Command failed with error 13 (Unauthorized): 'command listCollections requires authentication' on server localhost:27017. The full response is {"ok": 0.0, "errmsg": "command listCollections requires authentication", "code": 13, "codeName": "Unauthorized"}
```

**DBeaver:**

Set "Mechanism" to `SCRAM-SHA-1` and "Source" to `admin`.
