# Redis

<!--
https://medium.com/swlh/use-the-source-redis-internal-tricks-5a8b735b9ef0
-->

## CLI

### Installation

#### Homebrew

```sh
brew install redis
```

### Zypper

```sh
sudo zypper refresh
sudo zypper install -y redis
```

#### Linux

```sh
curl http://download.redis.io/releases/redis-5.0.3.tar.gz | tar -xzC /tmp
( cd /tmp/redis-5.0.3 && make && sudo make install PREFIX=/usr/local/redis )
```

```sh
sudo mkdir -p /usr/local/redis/conf
```

```sh
sudo cp /tmp/redis-5.0.3/redis.conf /usr/local/redis/conf
```

```sh
rm -r /tmp/redis-5.0.3
```

### Configuration

#### Linux

```sh
sudo adduser -Mrs /bin/false redis
```

```sh
sudo install -dm 775 -o redis -g redis /var/lib/redis
```

```sh
sudo sed -ie '/^supervised/ s/no/systemd/g' /usr/local/redis/conf/redis.conf
sudo sed -i 's|^dir .*|dir /var/lib/redis|' /usr/local/redis/conf/redis.conf
```

### Commands

```sh
redis-server -h

redis-cli -h
```

### Usage

```sh
#
redis-cli \
  -h 127.0.0.1 \
  -p 6379 \
  -a [password] INFO | \
    grep '^redis_version'
```

### Service

#### Homebrew

```sh
brew services start redis
```

#### Linux

```sh
sudo tee /usr/lib/systemd/system/redis.service << EOF
[Unit]
Description=Redis In-Memory Data Store
After=network.target

[Service]
Type=simple
User=redis
Group=redis
ExecStart=/usr/local/redis/bin/redis-server /usr/local/redis/conf/redis.conf
ExecStop=/usr/local/redis/bin/redis-cli shutdown
Restart=always

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now redis
```

### Tips

#### Queries

```sql
LLEN [queue_name]
RPOP [queue_name]
SUBSCRIBE [queue_name]
```

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/redis#configuration)

### Install

```sh
kubectl create namespace redis
```

```sh
helm install stable/redis \
  -n redis \
  --namespace redis
```

### Status

```sh
kubectl rollout status statefulset/redis-master -n redis
```

### Logs

```sh
kubectl logs -l 'app=redis' -n redis -f
```

### DNS

```sh
dig @10.96.0.10 redis-master.redis.svc.cluster.local +short
nslookup redis-master.redis.svc.cluster.local 10.96.0.10
```

### Secret

```sh
kubectl get secret redis \
  -o jsonpath='{.data.redis-password}' \
  -n redis | \
    base64 --decode; echo
```

### Tips

#### Storage Class

<!-- ```sh
kubectl get pvc -l 'app=redis,release=polyaxon' -o json -n polyaxon | \
  jq -r '.items[] | select(.status.phase | contains("Pending")) | .metadata.name' | \
  xargs kubectl get pvc -o yaml -n polyaxon --export | \
  yq w - 'items[*].spec.storageClassName' nas-client | \
  kubectl replace -f - --force
``` -->

```sh
kubectl get pvc -n polyaxon

kubectl get pvc redis-data-polyaxon-redis-slave-1 -o yaml -n polyaxon | \
  yq w - 'spec.storageClassName' nas-client | \
  kubectl replace -f - --force
```

### Delete

```sh
helm delete redis --purge
kubectl delete namespace redis --grace-period=0 --force
```

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
  -h redis \
  -v redis-data:/data \
  -p 6379:6379 \
  --name redis \
  --network workbench \
  docker.io/library/redis:5.0.5-alpine3.9

# With auth
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -e REDIS_PASSWORD='redis' \
  -v redis-data:/data \
  -p 6379:6379 \
  --name redis \
  --network workbench \
  docker.io/library/redis:5.0.5-alpine3.9 /bin/sh -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'
```

### Remove

```sh
docker rm -f redis

docker volume rm redis-data
```
