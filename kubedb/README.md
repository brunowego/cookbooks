# KubeDB

<!--
NEED ENTERPRICE LICENSE
-->

**Keywords:** Kubernetes DBaaS

## Links

- [Org. Repository](https://github.com/kubedb)
- [Main Website](https://kubedb.com)

## Helm

### Dependencies

- [Cert Manager (cert-manager)](/cert-manager/README.md)
  - [Local](/cert-manager/cluster-issuer/letsencrypt/local.md)

### References

- [Configuration](https://github.com/kubedb/installer/tree/master/charts/kubedb#configuration)

### Repository

```sh
helm repo add appscode 'https://charts.appscode.com/stable'
helm repo update
```

### License

```sh
#
export K8S_METADATA_UID="$(kubectl get ns kube-system -o=jsonpath='{.metadata.uid}')"

#
curl -d 'email=<email>' -X POST https://license-issuer.appscode.com/register

#
curl -X POST -H "Content-Type: application/json" \
  -d '{"name":"***","email":"***","product":"kubedb-community","cluster":"***","tos":"true","token":"***"}' \
  https://license-issuer.appscode.com/issue-license

#
cat "$HOME/Downloads/kubedb-community-license-$K8S_METADATA_UID.txt"
```

<!--
https://appscode.com/issue-license
Product: KubeDB Enterprise Edition
-->

### Install

```sh
#
kubectl create ns kubedb && kubens kubedb

#
helm search repo -l appscode/kubedb

#
helm show values appscode/kubedb \
  --version v2023.11.2

#
helm install kubedb appscode/kubedb \
  --version v2023.11.2 \
  --set-file global.license="$HOME/Downloads/kubedb-community-license-$K8S_METADATA_UID.txt"
```

<!--
Enterprise

AutoScaler
Dashboard
-->

### Status

```sh
kubectl rollout status deploy/kubedb-kubedb-ops-manager
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=kubedb-ops-manager' \
  -f
```

### Issues

#### TBD

```log
kubedb-kubedb-provisioner-57bc86b84f-t4kjr operator I1103 15:20:28.008914       1 handler.go:218] Skipping kubedb.com/v1alpha2, Kind=Redis acme/server. Only demo namespace is supported for Community Edition. Please upgrade to Enterprise to use any namespace.
```

TODO

#### TBD

```log
license status invalid
```

TODO

### Delete

```sh
helm uninstall kubedb

kubectl delete ns kubedb \
  --grace-period=0 \
  --force
```
