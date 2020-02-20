# Apache CouchDB

## References

- [Fauxton Visual Guide](https://couchdb.apache.org/fauxton-visual-guide/index.html)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/couchdb#configuration)

### Install

```sh
kubectl create namespace couchdb
```

```sh
helm install stable/couchdb \
  -n couchdb \
  --namespace couchdb \
  --set ingress.enabled=true \
  --set ingress.hosts={couchdb.$(minikube ip).nip.io}
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n couchdb
```

```sh
helm upgrade couchdb stable/couchdb -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - couchdb.$(minikube ip).nip.io
EOF
) <(helm get values couchdb))
```

#### Remove

```sh
helm upgrade couchdb stable/couchdb -f <(yq d <(helm get values couchdb) ingress.tls)

kubectl delete secret example.tls-secret -n couchdb
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
dig @10.96.0.10 "couchdb.$(minikube ip).nip.io" +short
nslookup "couchdb.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret couchdb-couchdb \
  -o jsonpath='{.data.adminUsername}' \
  -n couchdb | \
    base64 --decode; echo

kubectl get secret couchdb-couchdb \
  -o jsonpath='{.data.adminPassword}' \
  -n couchdb | \
    base64 --decode; echo
```

### Web UI

```sh
# Fauxton Visual Guide
echo -e "[INFO]\thttp://couchdb.$(minikube ip).nip.io/_utils/"
```

### Delete

```sh
helm delete couchdb --purge
kubectl delete namespace couchdb --grace-period=0 --force
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
  -h couchdb \
  -e COUCHDB_USER=admin \
  -e COUCHDB_PASSWORD='Pa$$w0rd!' \
  -p 5984:5984 \
  --name couchdb \
  apache/couchdb:2.3
```

### Remove

```sh
docker rm -f couchdb
```
