# CockroachDB

## Helm

### Install

```sh
kubectl create namespace cockroach
```

```sh
helm install stable/cockroachdb \
  -n cockroachdb \
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
helm delete cockroachdb --purge
kubectl delete namespace cockroach --grace-period=0 --force

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
curl https://binaries.cockroachdb.com/cockroach-v2.1.6.linux-amd64.tgz | sudo tar -xzC /usr/local/bin --strip-components 1
```
