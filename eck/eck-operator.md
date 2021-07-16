# Elastic Cloud on Kubernetes (ECK) Operator

<!--
https://github.com/HoussemDellai/eck-fluentd-operators-kubernetes

https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-install-helm.html

https://github.com/jsa4000/Observable-Distributed-System/blob/master/docs/04_elastic_cloud_on_kubernetes.md
-->

## Links

- [Code Repository](https://github.com/elastic/cloud-on-k8s)

## Kubernetes Manifests

### Install

```sh
kubectl apply \
  -f 'https://download.elastic.co/downloads/eck/1.6.0/all-in-one.yaml'
```

### Delete

```sh
#
kubectl delete \
  -f 'https://download.elastic.co/downloads/eck/1.6.0/all-in-one.yaml'
```

## Helm

### References

- [Usage](https://github.com/elastic/cloud-on-k8s/tree/master/deploy/eck-operator#usage)

### Repository

```sh
helm repo add elastic 'https://helm.elastic.co'
helm repo update
```

### Install

```sh
#
kubectl create namespace elastic-system
```

```sh
helm install elastic-operator elastic/eck-operator \
  --namespace elastic-system \
  --version 1.6.0
```

### Status

```sh
kubectl rollout status statefulset/elastic-operator \
  -n elastic-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=elastic-operator' \
  -n elastic-system \
  -f
```

### Delete

```sh
helm uninstall elastic-operator \
  -n elastic-system

kubectl delete namespace elastic-system \
  --grace-period=0 \
  --force
```

## Elasticsearch Cluster and Kibana Instance

### Install

```sh
#
kubectl create namespace logging

#
cat << EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: elastic-cluster
spec:
  version: 7.12.1
  nodeSets:
  - name: default
    count: 1
    config:
      node.master: true
      node.data: true
      node.ingest: true
      node.store.allow_mmap: false
EOF

#
cat << EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: kibana.k8s.elastic.co/v1beta1
kind: Kibana
metadata:
  name: kibana-cluster
spec:
  version: 7.12.1
  count: 1
  elasticsearchRef:
    name: elastic-cluster
EOF
```

### Status

```sh
#
kubectl rollout status deployment/kibana-cluster-kb \
  -n logging
```

### Logs

```sh
#
kubectl logs \
  -l 'common.k8s.elastic.co/type=elasticsearch' \
  -n logging \
  -f

#
kubectl logs \
  -l 'common.k8s.elastic.co/type=kibana' \
  -n logging \
  -f
```

### Secrets

```sh
#
kubectl get secret \
  elastic-cluster-es-elastic-user \
  -n logging \
  -o=jsonpath='{.data.elastic}' | \
    base64 --decode; echo
```

### Delete

```sh
#
kubectl delete pod \
  -l 'common.k8s.elastic.co/type=elasticsearch' \
  -n logging

kubectl delete pod \
  -l 'common.k8s.elastic.co/type=kibana' \
  -n logging

#
kubectl delete namespace logging \
  --grace-period=0 \
  --force
```
