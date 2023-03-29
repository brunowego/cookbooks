# MongoDB

<!--
https://linkedin.com/learning/nosql-essential-training/
https://linkedin.com/learning/learning-mongodb/
-->

## References

- [MongoDB ObjectId ↔ Timestamp Converter](https://steveridout.github.io/mongo-object-time/)

## Docker

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
  docker.io/library/mongo:4.4.6

# With User and Password
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongodb \
  -v mongodb-data:/data/db \
  -v mongodb-configdb:/data/configdb \
  -e MONGO_INITDB_DATABASE='dev' \
  -e MONGO_INITDB_ROOT_USERNAME='dev' \
  -e MONGO_INITDB_ROOT_PASSWORD='dev' \
  -p 27017:27017 \
  --name mongodb \
  --network workbench \
  docker.io/library/mongo:4.4.6
```

<!--
MONGODB_URI='mongodb+srv://dev:dev@127.0.0.1:27017/dev'
-->

### Client

```sh
docker run -it --rm \
  docker.io/library/mongo:4.4.6 mongo -h
```

### Remove

```sh
docker rm -f mongodb

docker volume rm \
  mongodb-data \
  mongodb-configdb
```

## Docker Compose

### Manifest

```yml
---
version: '3'

services:
  mongodb:
    image: docker.io/library/mongo:4.4.6
    container_name: mongodb
    hostname: mongodb
    volumes:
      - type: volume
        source: mongodb-data
        target: /data/db
      - type: volume
        source: mongodb-configdb
        target: /data/configdb
    environment:
      MONGO_INITDB_ROOT_USERNAME: user
      MONGO_INITDB_ROOT_PASSWORD: pass
    ports:
      - target: 27017
        published: 27017
        protocol: tcp
    networks:
      - workbench
    restart: always

volumes:
  mongodb-data:
    driver: local
  mongodb-configdb:
    driver: local

networks:
  workbench:
    name: workbench
    external: true
```

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
  --host [hostname] \
  --port 27017 \
  -u [username] \
  -p [password] \
  --authenticationDatabase [db-name]

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
mongo [db-name] <<-EOSQL
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
