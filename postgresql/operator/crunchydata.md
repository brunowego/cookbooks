# PostgreSQL Operator by CrunchyData

## Helm

### Links

- [Code Repository](https://github.com/CrunchyData/postgres-operator)
- [Main Website](https://access.crunchydata.com/documentation/postgres-operator/latest)

### Install

```sh
#
kubectl create ns postgres-operator && kubens postgres-operator

#
helm install postgres-operator oci://registry.developers.crunchydata.com/crunchydata/pgo \
  --version 5.4.3
```

### Status

```sh
kubectl rollout status deploy/pgo
```

### Logs

```sh
kubectl logs \
  -l 'postgres-operator.crunchydata.com/control-plane=pgo' \
  -f
```

### Instance Manifest

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: postgres-operator.crunchydata.com/v1beta1
kind: PostgresCluster
metadata:
  name: postgresql
spec:
  postgresVersion: 14
  backups:
    pgbackrest:
      repos:
        - name: repo1
          volume:
            volumeClaimSpec:
              accessModes:
                - ReadWriteOnce
              # storageClassName:
              resources:
                requests:
                  storage: 1Gi
  instances:
    - name: instance1
      replicas: 1
      dataVolumeClaimSpec:
        accessModes:
          - ReadWriteOnce
        # storageClassName:
        resources:
          requests:
            storage: 1Gi
  patroni:
    dynamicConfiguration:
      postgresql:
        pg_hba:
          - host all all 0.0.0.0/0 scram-sha-256
          - host all all ::1/128 scram-sha-256
EOF
```

### Delete

```sh
helm uninstall postgres-operator

kubectl delete ns postgres-operator \
  --grace-period=0 \
  --force
```
