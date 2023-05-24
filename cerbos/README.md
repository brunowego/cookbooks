# Cerbos

**Keywords:** Authz

## Links

- [Code Repository](https://github.com/cerbos/cerbos)
- [Main Website](https://cerbos.dev)
- [Docs](https://docs.cerbos.dev)
  - Configuration / Storage / [Postgres Driver](https://docs.cerbos.dev/cerbos/latest/configuration/storage.html#postgres)

## CLO

### Installation

#### Darwin Binary

```sh
CERBOS_VERSION="$(curl -s https://api.github.com/repos/cerbos/cerbos/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl -L \
    "https://github.com/cerbos/cerbos/releases/download/v${CERBOS_VERSION}/cerbos_${CERBOS_VERSION}_Darwin_x86_64.tar.gz" | \
      tar -xzC /usr/local/bin cerbos
```

### Commands

```sh
cerbos -h
```

<!-- ### Usage

```sh
#
cerbos
``` -->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h cerbos \
  -p 3592:3592 \
  -p 3593:3593 \
  --name cerbos \
  --network workbench \
  ghcr.io/cerbos/cerbos:0.26.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3592'
```

| Login   | Password |
| ------- | -------- |
| `admin` | `admin`  |

### Remove

```sh
docker rm -f cerbos

docker volume rm cerbos
```

## Helm

### References

- [Helm Repository](https://github.com/cerbos/cerbos/tree/main/deploy/charts/cerbos)

### Install

```sh
#
kubectl create ns cerbos
# kubectl create ns authz

#
kubens cerbos

#
export HELM_EXPERIMENTAL_OCI=1

#
helm install cerbos oci://ghcr.io/cerbos/helm-charts/cerbos \
  --version 0.9.0
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/monitoring-cerbos \
  8080:80
-->

### Status

```sh
kubectl rollout status deploy/cerbos
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=cerbos' \
  -f
```

### Delete

```sh
helm uninstall cerbos

kubectl delete ns cerbos \
  --grace-period=0 \
  --force
```
