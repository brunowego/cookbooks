# CockroachDB

<!--
https://app.pluralsight.com/library/courses/big-data-ldn-session-79/table-of-contents
-->

## Links

- [Code Repository](https://github.com/cockroachdb/cockroach)
- [Main Website](https://cockroachlabs.com/)

## Guides

- [Cockroach University](https://university.cockroachlabs.com/categories)

## Helm

### References

- [Configuration](https://github.com/cockroachdb/helm-charts/tree/master/cockroachdb#configuration)

### Repository

```sh
helm repo add cockroachdb 'https://charts.cockroachdb.com'
helm repo update
```

### Install

```sh
kubectl create ns cockroach
```

```sh
helm install cockroachdb cockroachdb/cockroachdb \
  --namespace cockroach \
  --set Storage=10Gi \
  --set NetworkPolicy.Enabled=true \
  --set Service.Type=LoadBalancer \
  --set Secure.Enabled=true
```

```sh
watch kubectl get csr # wait to finish adding csr's for cockroach.
```

```sh
kubectl get csr -o json | \
  jq -r '.items[] | select(.metadata.name | contains("cockroach.")) | .metadata.name' | \
  xargs -n 1 kubectl certificate approve
```

```sh
kubectl rollout status statefulset/cockroachdb-cockroachdb -n cockroach
```

### Commands

```sh
export CDB_HOST=$(kubectl get service cockroachdb-cockroachdb-public -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' -n cockroach)

cockroachdb sql \
  --insecure \
  --url "postgresql://root@$CDB_HOST:26257?sslmode=disable"
```

### Delete

```sh
helm uninstall cockroachdb \
  -n cockroachdb

kubectl delete ns cockroach \
  --grace-period=0 \
  --force

kubectl get csr -o json | \
  jq -r '.items[] | select(.metadata.name | contains("cockroach.")) | .metadata.name' | \
  xargs -n 1 kubectl delete csr
```

## CLI

### Installation

#### Homebrew

```sh
brew install cockroach
```

#### Linux

```sh
curl 'https://binaries.cockroachdb.com/cockroach-v2.1.6.linux-amd64.tgz' | \
  sudo tar -xzC /usr/local/bin --strip-components 1
```
