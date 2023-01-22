# OpenSearch

## Links

- [Code Repository](https://github.com/opensearch-project/OpenSearch)
- [Main Website](https://opensearch.org)

## Helm

### References

- [Configuration](https://github.com/opensearch-project/helm-charts/tree/main/charts/opensearch#configuration)

### Repository

```sh
helm repo add opensearch 'https://opensearch-project.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns opensearch
# kubectl create ns search

#
kubens opensearch

#
helm search repo -l opensearch/opensearch

#
helm install opensearch opensearch/opensearch \
  --version 2.9.0 \
  -f <(cat << EOF
singleNode: true
EOF
)

#
kubectl get all
```

### Status

```sh
kubectl rollout status statefulset/opensearch-cluster-master
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=opensearch-cluster-master' \
  -f
```

### Delete

```sh
helm uninstall opensearch

kubens default

kubectl delete ns opensearch \
  --grace-period=0 \
  --force
```
