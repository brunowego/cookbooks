# Artifactory

## Helm

### Dependencies

- nginx-ingress

### Install

```sh
helm repo add jfrog https://charts.jfrog.io/
helm repo update
```

```sh
kubectl create namespace artifactory
```

```sh
helm install jfrog/artifactory \
  -n artifactory \
  --namespace artifactory \
  --set artifactory.image.repository=docker.bintray.io/jfrog/artifactory-oss \
  --set ingress.enabled=true \
  --set ingress.hosts={artifactory.example.com} \
  --set nginx.enabled=false
```

```sh
kubectl rollout status deploy/artifactory-artifactory-nginx -n artifactory
```

### Delete

```sh
helm delete artifactory --purge
kubectl delete namespace artifactory --grace-period=0 --force
```

## Docker

### Volume

```sh
docker volume create artifactory-postgres-data
docker volume create artifactory-data
```

### Running

```sh
docker run -d \
  -h postgres.artifactory.local \
  -e POSTGRES_USER=artifactory \
  -e POSTGRES_PASSWORD=artifactory \
  -e POSTGRES_DB=artifactory \
  -v artifactory-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name artifactory-postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h oss.artifactory.local \
  -e DB_TYPE=postgresql \
  -e DB_HOST=artifactory-postgres \
  -e DB_USER=artifactory \
  -e DB_PASSWORD=artifactory \
  -e DB_URL='jdbc:postgresql://artifactory-postgres:5432/artifactory' \
  -v artifactory-data:/var/opt/jfrog/artifactory \
  -p 8081:8081 \
  --name artifactory-oss \
  --restart always \
  --link artifactory-postgres \
  docker.bintray.io/jfrog/artifactory-oss:6.10.0
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8081"
```

### Test

```sh
curl -Ikv "http://$(docker-machine ip):8081/api/system/ping"
```

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
