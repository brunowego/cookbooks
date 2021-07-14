# Elastic Cloud on Kubernetes (ECK) Operator

<!--
https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-install-helm.html
-->

## Links

- [Code Repository](https://github.com/elastic/cloud-on-k8s)

## Kubernetes Manifests

### Install

```sh
kubectl apply \
  -f 'https://download.elastic.co/downloads/eck/1.6.0/all-in-one.yaml'
```

```sh
#
kubectl create namespace logging

#
cat << EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: elasticsearch.k8s.elastic.co/v1beta1
kind: Elasticsearch
metadata:
  name: quickstart
spec:
  version: 7.5.0
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
  name: quickstart
spec:
  version: 7.5.0
  count: 1
  elasticsearchRef:
    name: quickstart
EOF
```

### Delete

```sh
kubectl delete \
  -f 'https://download.elastic.co/downloads/eck/1.6.0/all-in-one.yaml'
```
