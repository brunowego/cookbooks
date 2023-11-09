# kubectl-secret

## Tips

### Decode Base64 Secrets

```sh
kubectl get secret <name> \
  -o json | \
    jq '.data | map_values(@base64d)'
```
