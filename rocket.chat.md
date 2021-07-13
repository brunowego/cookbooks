# Rocket.chat

## Helm

### References

- [Configuration](https://github.com/RocketChat/helm-charts/tree/master/rocketchat#configuration)

### Repository

```sh
helm repo add rocketchat 'https://rocketchat.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
export INGRESS_HOST='127.0.0.1'

#
kubectl create namespace rocketchat
```

```sh
helm install rocketchat rocketchat/rocketchat \
  --namespace rocketchat \
  --version 3.1.0 \
  -f <(cat << EOF
host: rocketchat.${INGRESS_HOST}.nip.io
mongodb:
  auth:
    database: rocketchat
    username: rocketchat
    password: $(echo -n $(openssl rand -base64 32))
    rootPassword: $(echo -n $(openssl rand -base64 32))
persistence:
  enabled: true
ingress:
  enabled: true
EOF
)
```

### Status

```sh
#
kubectl rollout status statefulset/rocketchat-mongodb \
  -n rocketchat

#
kubectl rollout status deployment/rocketchat-rocketchat \
  -n rocketchat
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=rocketchat' \
  -n rocketchat \
  -f
```

### Ingress

```sh
#
echo -e "[INFO]\thttp://rocketchat.${INGRESS_HOST}.nip.io"
```

### Delete

```sh
helm uninstall rocketchat \
  -n rocketchat

kubectl delete namespace rocketchat \
  --grace-period=0 \
  --force
```

## Docker

### Running

```sh
docker run -d \
  -h mongo.rocketchat.local \
  -v rocketchat-mongo-data:/data/db \
  -e MONGO_INITDB_DATABASE='rocketchat' \
  -p 27017:27017 \
  --name rocketchat-mongo \
  docker.io/library/mongo:4.0.20 mongod \
    --oplogSize 128 \
    --replSet rs0 \
    --storageEngine wiredTiger
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

### Remove

```sh
docker rm -f \
  rocketchat-mongo \
  rocketchat

docker volume rm \
  rocketchat-mongo-data \
  rocketchat-uploads
```

## CLI

### Installation

#### Homebrew

```sh
brew install --cask rocket-chat
```
