# Harbor

**Keywords:** Vulnerability Scanning, Auditing

## Links

- [Code Repository](https://github.com/goharbor/harbor)
- [Main Website](https://goharbor.io/)

## Helm

### Included

- Database
- [Redis](/redis/README.md)
- [Trivy](/trivy/README.md)

### References

- [Configuration](https://github.com/goharbor/harbor-helm#configuration)

### Repository

```sh
helm repo add harbor 'https://helm.goharbor.io'
helm repo update
```

### Install

```sh
#
kubectl create ns harbor-system
# kubectl create ns security

#
helm search repo -l harbor/harbor

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install harbor harbor/harbor \
  --namespace harbor-system \
  --version 1.10.2 \
  -f <(cat << EOF
expose:
  ingress:
    className: nginx
    hosts:
      core: core.harbor.${K8S_DOMAIN}
      notary: notary.harbor.${K8S_DOMAIN}

externalURL: http://core.harbor.${K8S_DOMAIN}
EOF
)

#
kubectl get all -n harbor-system
```

### Status

```sh
kubectl rollout status deployment.apps/harbor-portal \
  -n harbor-system
```

### Logs

```sh
kubectl logs \
  -l 'app=harbor,component=portal' \
  -n harbor-system \
  -f
```

### Secret

<!--
Username: admin
-->

```sh
kubectl get secret harbor-core \
  -o jsonpath='{.data.HARBOR_ADMIN_PASSWORD}' \
  -n harbor-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall harbor \
  -n harbor-system

kubectl delete ns harbor-system \
  --grace-period=0 \
  --force
```
