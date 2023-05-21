# Cerbos

**Keywords:** Authz

## Links

- [Code Repository](https://github.com/cerbos/cerbos)
- [Main Website](https://cerbos.dev)

<!--
https://cerbos.dev/ecosystem/nestjs
https://github.com/cerbos/nestjs-cerbos
-->

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
