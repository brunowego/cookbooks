# Artifactory OSS

## Helm

### References

- [Configuration](https://github.com/jfrog/charts/tree/master/stable/artifactory-oss#configuration)

### Repository

```sh
helm repo add jfrog https://charts.jfrog.io
helm repo update jfrog
```

### Install

```sh
kubectl create namespace artifactory
```

```sh
helm install jfrog/artifactory-oss \
  -n artifactory-oss \
  --namespace artifactory \
  --set artifactory.nginx.enabled=false \
  --set artifactory.ingress.enabled=true \
  --set "artifactory.ingress.hosts[0]=artifactory.$(minikube ip).nip.io"
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n artifactory
```

```sh
helm upgrade artifactory-oss jfrog/artifactory-oss -f <(yq m <(cat << EOF
artifactory:
  ingress:
    tls:
      - secretName: example.tls-secret
        hosts:
          - artifactory.$(minikube ip).nip.io
EOF
) <(helm get values artifactory-oss))
```

#### Remove

```sh
helm upgrade artifactory-oss jfrog/artifactory-oss -f <(yq d <(helm get values artifactory-oss) artifactory.ingress.tls)

kubectl delete secret example.tls-secret -n artifactory
```

### Status

```sh
kubectl rollout status statefulset/artifactory-oss-artifactory -n artifactory
```

### Logs

```sh
kubectl logs -l 'app=artifactory,component=artifactory' -n artifactory -f
```

### DNS

```sh
dig @10.96.0.10 artifactory-oss-artifactory.artifactory.svc.cluster.local +short
nslookup artifactory-oss-artifactory.artifactory.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "artifactory.$(minikube ip).nip.io" +short
nslookup "artifactory.$(minikube ip).nip.io" 10.96.0.10
```

### Credentials

| Username | Password |
| --- | --- |
| `admin` | `password` |

### Delete

```sh
helm delete artifactory --purge
kubectl delete namespace artifactory --grace-period=0 --force
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
  -h postgres \
  -e POSTGRES_USER='artifactory' \
  -e POSTGRES_PASSWORD='artifactory' \
  -e POSTGRES_DB='artifactory' \
  -v artifactory-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name artifactory-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h artifactory-oss \
  -e DB_TYPE='postgresql' \
  -e DB_HOST='artifactory-postgres' \
  -e DB_USER='artifactory' \
  -e DB_PASSWORD='artifactory' \
  -e DB_URL='jdbc:postgresql://artifactory-postgres:5432/artifactory' \
  -v artifactory-data:/var/opt/jfrog/artifactory \
  -p 8081:8081 \
  --name artifactory-oss \
  --network workbench \
  docker.bintray.io/jfrog/artifactory-oss:6.16.0
```

```sh
# Test
curl -Ikv 'http://127.0.0.1:8081/api/system/ping'

# Browser
echo -e '[INFO]\thttp://127.0.0.1:8081'
```

| Username | Password |
| --- | --- |
| `admin` | `password` |

### Remove

```sh
docker rm -f artifactory-postgres artifactory-oss
docker volume rm artifactory-postgres-data artifactory-data
```

## CLI

### Installation

#### Homebrew

```sh
brew install artifactory
```

### Service

#### Homebrew

```sh
brew services start artifactory
```

### Docs

#### Generic

```sh
wget \
  --user=[user] \
  --password='[password]' \
  [url]
```
