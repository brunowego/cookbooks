# Apache CouchDB

## Links

- [Code Repository](https://github.com/apache/couchdb)
- [Main Website](https://couchdb.apache.org)

## References

- [Fauxton Visual Guide](https://couchdb.apache.org/fauxton-visual-guide/index.html)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/couchdb#configuration)

### Install

```sh
kubectl create ns couchdb
```

```sh
helm install couchdb stable/couchdb \
  --namespace couchdb \
  --set ingress.enabled=true \
  --set ingress.hosts={couchdb.${K8S_DOMAIN}}
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls couchdb.tls-secret \
  --cert='/etc/ssl/certs/couchdb/root-ca.crt' \
  --key='/etc/ssl/private/couchdb/root-ca.key' \
  -n couchdb
```

```sh
helm upgrade couchdb stable/couchdb -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: couchdb.tls-secret
      hosts:
        - couchdb.${K8S_DOMAIN}
EOF
) <(helm get values couchdb))
```

#### Remove

```sh
helm upgrade couchdb stable/couchdb -f <(yq d <(helm get values couchdb) ingress.tls)

kubectl delete secret couchdb.tls-secret -n couchdb
```

### Status

```sh
kubectl rollout status statefulset/couchdb-couchdb -n couchdb
```

### Logs

```sh
kubectl logs -l 'app=couchdb' -n couchdb -f
```

### DNS

```sh
dig @10.96.0.10 couchdb-svc-couchdb.couchdb.svc.cluster.local +short
nslookup couchdb-svc-couchdb.couchdb.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "couchdb.${K8S_DOMAIN}" +short
nslookup "couchdb.${K8S_DOMAIN}" 10.96.0.10
```

### Secret

```sh
kubectl get secret couchdb-couchdb \
  -o jsonpath='{.data.adminUsername}' \
  -n couchdb | \
    base64 -d; echo

kubectl get secret couchdb-couchdb \
  -o jsonpath='{.data.adminPassword}' \
  -n couchdb | \
    base64 -d; echo
```

### Web UI

```sh
# Fauxton Visual Guide
echo -e "[INFO]\thttp://couchdb.${K8S_DOMAIN}/_utils/"
```

### Delete

```sh
helm uninstall couchdb -n couchdb
kubectl delete ns couchdb --grace-period=0 --force
```

## Host

### Installation

#### Homebrew

```sh
brew install couchdb
```

#### YUM

```sh
cat << \EOF | sudo tee /etc/yum.repos.d/bintray-apache-couchdb-rpm.repo
[bintray--apache-couchdb-rpm]
name=bintray--apache-couchdb-rpm
baseurl=http://apache.bintray.com/couchdb-rpm/el$releasever/$basearch/
gpgcheck=0
repo_gpgcheck=0
enabled=1
EOF
```

```sh
yum check-update

# Repo: EPEL
sudo yum -y install couchdb
```

#### Chocolatey

```sh
choco install -y couchdb
```

### Service

#### Systemd

```sh
sudo systemctl enable --now couchdb
```

### Configuration

#### Web Admin

```sh
sudo sed -i '/^bind_address/ s/127.0.0.1/0.0.0.0/g' /opt/couchdb/etc/default.ini
```

```sh
# Systemd
sudo systemctl restart couchdb
```

```sh
echo -e "[INFO]\thttp://127.0.0.1:5984/_utils/"
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
  -h couchdb \
  -v couchdb-data:/opt/couchdb/data \
  -e COUCHDB_USER='admin' \
  -e COUCHDB_PASSWORD='Pa$$w0rd!' \
  -p 5984:5984 \
  --name couchdb \
  --network workbench \
  docker.io/apache/couchdb:3.3.0
```

### Issues

#### Missing Tables

```log
budibase-couchdb  | [notice] 2023-01-17T19:43:37.003430Z nonode@nohost <0.404.0> -------- Missing system database _users
```

```sh
export COUCH_DB_USER='admin'
export COUCH_DB_PASSWORD='Pa$$w0rd!'

curl -u "$COUCH_DB_USER":"$COUCH_DB_PASSWORD" -X PUT 127.0.0.1:5984/_users
curl -u "$COUCH_DB_USER":"$COUCH_DB_PASSWORD" -X PUT 127.0.0.1:5984/_replicator
```

### Remove

```sh
docker rm -f couchdb

docker volume rm couchdb-data
```
