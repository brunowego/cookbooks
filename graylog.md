# Graylog

<!-- https://github.com/petzah/graylog-plugin-matomo -->

## References

- [Server Configuration](https://docs.graylog.org/en/stable/pages/configuration/server.conf.html)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/graylog#configuration)

### Install

```sh
kubectl create namespace graylog
```

```sh
helm install stable/graylog \
  -n graylog \
  --namespace graylog \
  --set graylog.ingress.enabled=true \
  --set graylog.ingress.hosts={graylog.$(minikube ip).nip.io} \
  --set graylog.rootUsername='admin' \
  --set graylog.rootPassword="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" \
  --set graylog.rootEmail="admin@$(minikube ip).nip.io"
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n graylog
```

```sh
helm upgrade graylog stable/graylog -f <(yq m <(cat << EOF
graylog:
  ingress:
    tls:
      - secretName: example.tls-secret
        hosts:
          - graylog.$(minikube ip).nip.io
EOF
) <(helm get values graylog))
```

#### Remove

```sh
helm upgrade graylog stable/graylog -f <(yq d <(helm get values graylog) ingress.tls)

kubectl delete secret example.tls-secret -n graylog
```

### Status

```sh
kubectl rollout status statefulset/graylog -n graylog
```

### Logs

```sh
kubectl logs -l 'app.kubernetes.io/name=graylog' -n graylog -f
kubectl logs -l 'app=elasticsearch,component=master' -n graylog -f
kubectl logs -l 'app=elasticsearch,component=client' -n graylog -f
kubectl logs -l 'app=elasticsearch,component=data' -n graylog -f
kubectl logs -l 'app=mongodb-replicaset' -n graylog -f
```

### DNS

```sh
dig @10.96.0.10 graylog-master.graylog.svc.cluster.local +short
nslookup graylog-master.graylog.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "graylog.$(minikube ip).nip.io" +short
nslookup "graylog.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret graylog \
  -o jsonpath='{.data.graylog-password-secret}' \
  -n graylog | \
    base64 --decode; echo
```

### Delete

```sh
helm delete graylog --purge
kubectl delete namespace graylog --grace-period=0 --force
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
  -h elasticsearch \
  -e discovery.type=single-node \
  -v graylog-elasticsearch-config:/usr/share/elasticsearch/config \
  -v graylog-elasticsearch-data:/usr/share/elasticsearch/data \
  -v graylog-elasticsearch-logs:/usr/share/elasticsearch/logs \
  -p 9200:9200 \
  -p 9300:9300 \
  --name graylog-elasticsearch \
  --network workbench \
  docker.io/library/elasticsearch:6.8.7
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongo \
  -v graylog-mongo-config:/data/configdb \
  -v graylog-mongo-data:/data/db \
  -e MONGO_INITDB_DATABASE='graylog' \
  -p 27017:27017 \
  --name graylog-mongo \
  --network workbench \
  docker.io/library/mongo:4.2.3
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h graylog \
  -e GRAYLOG_PASSWORD_SECRET='somepasswordpepper' \
  -e GRAYLOG_ROOT_PASSWORD_SHA2='8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918' \
  -e GRAYLOG_HTTP_EXTERNAL_URI='http://127.0.0.1:9000/' \
  -e GRAYLOG_ELASTICSEARCH_HOSTS='http://graylog-elasticsearch:9200' \
  -e GRAYLOG_MONGODB_URI='mongodb://graylog-mongo:27017/graylog' \
  -v graylog-data:/usr/share/graylog/data \
  -p 1514:1514 \
  -p 1514:1514/udp \
  -p 9000:9000 \
  -p 12201:12201 \
  -p 12201:12201/udp \
  --name graylog \
  --network workbench \
  docker.io/graylog/graylog:3.2.3
```

> Wait! This process take a while.

```sh
docker logs -f graylog | sed '/Graylog server up and running./ q'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### State

```sh
#
docker stop graylog graylog-elasticsearch graylog-mongo

#
docker start graylog graylog-elasticsearch graylog-mongo
```

### Remove

```sh
docker rm -f graylog graylog-elasticsearch graylog-mongo

docker volume rm graylog-elasticsearch-config graylog-elasticsearch-data graylog-elasticsearch-logs graylog-mongo-config graylog-mongo-data  graylog-data
```
