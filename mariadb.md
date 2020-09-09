# MariaDB

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
  -h mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=user \
  -e MYSQL_DATABASE=default \
  -v mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name mariadb \
  --network workbench \
  docker.io/library/mariadb:10.4.8
```

### Remove

```sh
docker rm -f mariadb
docker volume rm mariadb-data
```

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/mariadb#configuration)

### Install

```sh
kubectl create namespace mariadb
```

```sh
helm install stable/mariadb \
  -n mariadb \
  --namespace mariadb
```

### NGINX Ingress

```sh
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq w <(helm get values nginx-ingress) tcp.3306 mariadb/mariadb:3306)
```

### Status

```sh
kubectl rollout status statefulset/mariadb-master -n mariadb
```

### Logs

```sh
kubectl logs -l 'app=mariadb' -n mariadb -f
```

### DNS

```sh
dig @10.96.0.10 mariadb.mariadb.svc.cluster.local +short
nslookup mariadb.mariadb.svc.cluster.local 10.96.0.10
```

### Secret

```sh
kubectl get secret mariadb \
  -o jsonpath='{.data.mariadb-root-password}' \
  -n mariadb | \
    base64 --decode; echo
```

### Delete

```sh
helm delete mariadb --purge
kubectl delete namespace mariadb --grace-period=0 --force
```

## CLI

### Installation

#### Homebrew

```sh
brew install mariadb
```

#### YUM

```sh
yum check-update
sudo yum -y install mariadb-server
```

#### APT

```sh
sudo apt update
sudo apt -y install mariadb-server
```

### Service

```sh
# Homebrew
brew services start mariadb

# Systemd
sudo systemctl enable --now mariadb
```
