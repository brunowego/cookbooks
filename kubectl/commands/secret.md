# kubectl-secret

<!--
kubectl create configmap store \
  --from-literal=sf_domain=acme.k8s.orb.local \
  --from-literal=admin_domain=acme-admin.k8s.orb.local
-->

## Tips

### Decode Base64 Secrets

```sh
#
kubectl get secret <name> \
  -o json | \
    jq '.data | map_values(@base64d)'

# GitHub Container Registry
kubectl get secret ghcr-auth \
  -o json | \
    jq '.data | map_values(@base64d)'
```
