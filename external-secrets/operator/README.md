# External Secrets Operator (ESO)

## Links

- [Code Repository](https://github.com/external-secrets/external-secrets/)

## Supported Keystores

- Akeyless
- Alibaba Cloud KMS
- AWS Parameter Store
- AWS Secrets Manager
- Azure Key Vault
- Generic Webhook
- GitLab Project Variables
- Google Cloud Secrets Manager
- [HashiCorp Vault](./hashicorp-vault.md)
- IBM Cloud Secrets Manager
- Oracle Vault
- Yandex Lockbox

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
helm search repo -l external-secrets/external-secrets

#
helm install external-secrets external-secrets/external-secrets \
  --namespace eso-system \
  --version 0.6.1

#
kubectl get all -n eso-system
```

### Status

```sh
kubectl rollout status deployment/external-secrets \
  -n eso-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=external-secrets' \
  -n eso-system \
  -f
```

### Delete

```sh
helm uninstall external-secrets \
  -n eso-system

kubectl delete ns eso-system \
  --grace-period=0 \
  --force
```
