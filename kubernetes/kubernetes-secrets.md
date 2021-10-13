# Kubernetes Secrets

## Tips

### Decode base64 Secrets

```sh
kubectl get secret [name] -o json | \
  jq '.data | map_values(@base64d)'
```
