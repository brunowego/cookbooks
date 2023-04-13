# External Secrets

## Links

- [Code Repository](https://github.com/external-secrets/external-secrets)
- [Main Website](https://external-secrets.io)
- Docs
  - [Provider](https://external-secrets.io/main/provider/aws-secrets-manager/)

## Glossary

- External Secrets Operator (ESO)

## Helm

### References

- [Values](https://github.com/external-secrets/external-secrets/tree/main/deploy/charts/external-secrets#values)

### Repository

```sh
helm repo add external-secrets 'https://charts.external-secrets.io'
helm repo update
```

### Install

```sh
#
kubectl create ns eso-system
# kubectl create ns security

#
kubens eso-system

#
helm search repo -l external-secrets/external-secrets

#
helm install external-secrets external-secrets/external-secrets \
  --version 0.7.2

#
kubectl get all
```

### Status

```sh
kubectl rollout status deployment/external-secrets
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=external-secrets' \
  -f

kubectl logs \
  -l 'app.kubernetes.io/name=external-secrets-cert-controller' \
  -f

kubectl logs \
  -l 'app.kubernetes.io/name=external-secrets-webhook' \
  -f
```

### Issues

#### TBD

```log
Warning  UpdateFailed  1s (x5 over 91s)  external-secrets  unable to unmarshal secret /my-app/stg/secrets: invalid character 'p' looking for beginning of value
```

TODO

### Delete

```sh
helm uninstall external-secrets

kubectl delete ns eso-system \
  --grace-period=0 \
  --force
```
