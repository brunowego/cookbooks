# MongoDB

<!--
https://www.linkedin.com/learning/learning-mongodb/modern-database-and-application-design-with-mongodb
-->

## References

- [MongoDB ObjectId ↔ Timestamp Converter](https://steveridout.github.io/mongo-object-time/)

## Helm

### References

- [Exposing TCP and UDP services](https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/exposing-tcp-udp-services.md)

### Install

```sh
kubectl create namespace mongodb
```

```sh
helm install stable/mongodb \
  -n mongodb \
  --namespace mongodb \
  --set ingress.enabled=true \
  --set ingress.hosts={mongodb.example.com}
```

### Secrets

```sh
kubectl get secret mongodb \
  -o jsonpath='{.data.mongodb-root-password}' \
  -n mongodb | \
    base64 --decode; echo
```

### NGINX Ingress

```sh
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq w <(helm get values nginx-ingress) tcp.27017 mongodb/mongodb:27017)
```

### Delete

```sh
helm delete mongodb --purge
kubectl delete namespace mongodb --grace-period=0 --force
```

<!-- ```sh
helm get values nginx-ingress > ./current-values.yaml
```

Adjust `^tcp: ` value:

```sh
vim ./current-values.yaml
```

```sh
helm upgrade nginx-ingress stable/nginx-ingress -f ./current-values.yaml
```

```sh
rm ./current-values.yaml
``` -->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongodb \
  -v mongodb-data:/data/db \
  -v mongodb-configdb:/data/configdb \
  -e MONGO_INITDB_ROOT_USERNAME='user' \
  -e MONGO_INITDB_ROOT_PASSWORD='pass' \
  -p 27017:27017 \
  --name mongodb \
  --network workbench \
  docker.io/library/mongo:4.0.20
```

```sh
sudo hostess add mongodb 127.0.0.1
```

### Client

```sh
docker run -it --rm \
  docker.io/library/mongo:4.0.20 mongo -h
```

### Remove

```sh
docker rm -f mongodb

docker volume rm mongodb-data mongodb-configdb
```

## Docker Compose

### Manifest

```yaml
version: '3.7'

services:
  mongodb:
    image: docker.io/library/mongo:4.0.20
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
