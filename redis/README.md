# Redis

<!--
https://medium.com/swlh/use-the-source-redis-internal-tricks-5a8b735b9ef0
-->

## Links

- [Main Website](https://redis.io/)

## Related

- [twemproxy (a.k.a nutcracker)](/twemproxy.md)

## Tools

- [DBeaver Community](/dbeaver/README.md)

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
  docker.io/library/redis:7.0.7

# With auth
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -e REDIS_PASSWORD='redis' \
  -v redis-data:/data \
  -p 6379:6379 \
  --name redis \
  --network workbench \
  --entrypoint /bin/sh \
  docker.io/library/redis:7.0.7 -c 'redis-server --requirepass ${REDIS_PASSWORD}'
```

<!--
--appendonly yes
-->

```env
#
REDIS_URL=redis://127.0.0.1:6379/0

#
REDIS_URL=redis://:redis@127.0.0.1:6379/0
```

### Testing

```sh
redis-cli \
  -h 127.0.0.1 \
  -p 6379 \
  INFO | \
    grep '^redis_version'

# With auth
redis-cli \
  -h 127.0.0.1 \
  -p 6379 \
  -a redis \
  INFO | \
    grep '^redis_version'
```

### Remove

```sh
docker rm -f redis

docker volume rm redis-data
```

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
#
curl 'http://download.redis.io/releases/redis-stable.tar.gz' | \
  tar -xzC /tmp

( cd /tmp/redis-stable && make && sudo make install PREFIX=/usr/local/redis )

#
sudo mkdir -p /usr/local/redis/conf

#
sudo cp /tmp/redis-stable/redis.conf /usr/local/redis/conf

#
rm -r /tmp/redis-stable
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
  -u <username> \
  -a <password> \
  INFO | \
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

- [Helm Repository](https://github.com/bitnami/charts/tree/master/bitnami/redis)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns redis

#
helm install redis bitnami/redis \
  --namespace redis \
  --version 15.6.4 \
  -f <(cat << EOF
auth:
  password: $(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)

master:
  resources:
    limits:
      cpu: 250m
      memory: 256Mi
    requests:
      cpu: 250m
      memory: 256Mi

replica:
  replicaCount: 1
  resources:
    limits:
      cpu: 250m
      memory: 256Mi
    requests:
      cpu: 250m
      memory: 256Mi
EOF
)
```

### Status

```sh
kubectl rollout status statefulset/redis-master \
  -n redis
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=redis' \
  -n redis \
  -f
```

### Secret

```sh
kubectl get secret redis \
  -o jsonpath='{.data.redis-password}' \
  -n redis | \
    base64 -d; echo
```

### Testing

```sh
kubectl port-forward \
  --address 0.0.0.0 \
  -n redis \
  svc/redis-headless \
  6379:6379

redis-cli \
  -h 127.0.0.1 \
  -p 6379 \
  -a "$(kubectl get secret redis -o jsonpath='{.data.redis-password}' -n redis | base64 -d)" \
  INFO | \
    grep '^redis_version'
```

<!-- ### Ingress

```sh
#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
cat << EOF | kubectl apply \
  -n 'redis' \
  -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: redis
spec:
  rules:
  - host: redis.${DOMAIN}
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: redis-headless
            port:
              number: 6379
EOF
``` -->

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
helm uninstall redis \
  -n redis

kubectl delete ns redis \
  --grace-period=0 \
  --force
```

## Custom Resource (CR)

### Install

```sh
#
kubens redis

#
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: redis-data
  labels:
    com.example.service: redis-data
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
EOF

#
cat << \EOF | kubectl apply -f -
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis
  labels:
    com.example.service: redis
spec:
  replicas: 1
  selector:
    matchLabels:
      com.example.service: redis
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        com.example.service: redis
    spec:
      containers:
      - args:
        - /bin/sh
        - -c
        - redis-server --requirepass $${REDIS_PASSWORD}
        env:
        - name: REDIS_PASSWORD
          value: admin
        image: docker.io/library/redis:5-alpine
        name: redis
        ports:
        - containerPort: 6379
        resources: {}
        volumeMounts:
        - mountPath: /data
          name: redis-data
      hostname: redis
      restartPolicy: Always
      volumes:
      - name: redis-data
        persistentVolumeClaim:
          claimName: redis-data
EOF

#
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: Service
metadata:
  name: redis
  labels:
    com.example.service: redis
spec:
  ports:
  - name: '6379'
    port: 6379
    targetPort: 6379
  selector:
    com.example.service: redis
EOF
```

### Testing

```sh
#
kubens redis

#
kubectl port-forward \
  --address 0.0.0.0 \
  svc/redis \
  6379:6379

#
redis-cli \
  -h 127.0.0.1 \
  -p 6379 \
  -a admin \
  INFO | \
    grep '^redis_version'
```

## Issues

### Authentication Required

```sh
[ioredis] Unhandled error event: ReplyError: NOAUTH Authentication required.
```

TODO

<!--
https://serverfault.com/questions/722803/redis-error-noauth-authentication-required
-->
