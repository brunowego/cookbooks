# PostgreSQL Operator by Zalando

## Helm

### Links

- [Code Repository](https://github.com/zalando/postgres-operator)
- [Main Website](https://postgres-operator.readthedocs.io)

### References

- [Values](https://github.com/zalando/postgres-operator/blob/master/charts/postgres-operator/values.yaml)

### Repository

```sh
helm repo add postgres-operator-charts 'https://opensource.zalando.com/postgres-operator/charts/postgres-operator'
helm repo update
```

### Install

```sh
#
kubectl create ns postgres-operator && kubens postgres-operator

#
helm search repo -l postgres-operator-charts/postgres-operator

#
helm install postgres-operator postgres-operator-charts/postgres-operator \
  --version 1.10.1
```

### Status

```sh
kubectl rollout status deploy/postgres-operator
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=postgres-operator' \
  -f
```

### Instance Manifest

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: acid.zalan.do/v1
kind: postgresql
metadata:
  name: postgresql
spec:
  numberOfInstances: 1
  postgresql:
    version: '11'
  teamId: acid
  volume:
    size: 10Gi
EOF
```

### Delete

```sh
helm uninstall postgres-operator

kubectl delete ns postgres-operator \
  --grace-period=0 \
  --force
```
