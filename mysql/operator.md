# MySQL Operator

<!--
https://artifacthub.io/packages/helm/presslabs/mysql-operator
-->

## Links

- [Code Repository](https://github.com/bitpoke/mysql-operator)
- [orchestrator](/orchestrator.md)

## Helm

### References

- [Configuration](https://github.com/bitpoke/mysql-operator/tree/master/charts/mysql-operator#configuration)

### Repository

```sh
helm repo add presslabs 'https://presslabs.github.io/charts'
helm repo update
```

### Install

```sh
#
kubectl create ns mysql-system

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install mysql-operator presslabs/mysql-operator \
  --namespace mysql-system \
  --version 0.5.0-rc.3 \
  -f <(cat << EOF
gracefulShutdown:
  enabled: true

orchestrator:
  ingress:
    enabled: true
    hosts:
    - host: orchestrator.${K8S_DOMAIN}
      paths: ['/']
EOF
)
```

### Status

```sh
kubectl rollout status statefulset/mysql-operator \
  -n mysql-system
```

### Logs

```sh
#
kubectl logs \
  -l 'release=mysql-operator' \
  -c operator \
  -n mysql-system \
  -f

#
kubectl logs \
  -l 'release=mysql-operator' \
  -c orchestrator \
  -n mysql-system \
  -f
```

### Delete

```sh
helm uninstall mysql-operator \
  -n mysql-system

kubectl delete ns mysql-system \
  --grace-period=0 \
  --force
```

## Cluster Creation

### Install

```sh
#
export K8S_NAMESPACE='my-app'

#
kubectl create ns "$K8S_NAMESPACE"

#
cat << EOF | kubectl apply \
  -n "$K8S_NAMESPACE" \
  -f -
apiVersion: mysql.presslabs.org/v1alpha1
kind: MysqlCluster
metadata:
  name: mysql-cluster
spec:
  replicas: 1
  secretName: mysql-cluster-secret
  mysqlVersion: "5.7"
  minAvailable: "50%"
  mysqlConf:
    max_connections: '200'
    innodb-buffer-pool-size: 256M
    tmp_table_size: 256M
    max_heap_table_size: 256M
  podSpec:
    resources:
      requests:
        cpu: 200m
        memory: 1G
  volumeSpec:
    persistentVolumeClaim:
      accessModes:
      - ReadWriteOnce
      resources:
        requests:
          storage: 1Gi
---
apiVersion: v1
kind: Secret
metadata:
  name: mysql-cluster-secret
type: Opaque
data:
  ROOT_PASSWORD: $(echo -n "root" | base64)
EOF
```

<!--
spec:
  initFileExtraSQL:
    - "CREATE DATABASE IF NOT EXISTS Likes"
    - "USE Likes"
    - "CREATE TABLE IF NOT EXISTS Likes (postID varchar(255) NOT NULL,userID varchar(255) NOT NULL,Liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)"
-->

### Delete

```sh
kubectl delete mysqlcluster mysql-cluster \
  -n "$K8S_NAMESPACE"

kubectl delete ns "$K8S_NAMESPACE"
```
