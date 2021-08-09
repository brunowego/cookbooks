# Kubernetes External Secrets

## Links

- [Code Repository](https://github.com/external-secrets/kubernetes-external-secrets)

## Helm

### References

- [Configuration](https://github.com/external-secrets/kubernetes-external-secrets/tree/master/charts/kubernetes-external-secrets#configuration)

### Repository

```sh
helm repo add external-secrets 'https://external-secrets.github.io/kubernetes-external-secrets/'
helm repo update
```

### Install

```sh
#
helm install external-secrets external-secrets/kubernetes-external-secrets \
  --namespace kube-system \
  --version 8.3.0 \
  -f <(cat << EOF
env:
  AWS_REGION: us-east-1
EOF
)
```

<!-- #
helm install external-secrets external-secrets/kubernetes-external-secrets \
  --namespace kube-system \
  --version 8.3.0 \
  -f <(cat << EOF
env:
  VAULT_ADDR: http://vault.vault.internal:8200

serviceAccount:
  name: vault
  create: false
EOF
) -->

<!--
https://github.com/srinandan/apigee-vault/blob/047380c9606acf844123c49eaed7e6ecb3df08be/ext-secret-sample/client.yaml
-->

### Status

```sh
kubectl rollout status deploy/external-secrets-kubernetes-external-secrets \
  -n kube-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=external-secrets' \
  -n kube-system \
  -f
```

### Usage

```sh
#
aws \
  --region 'us-east-1' \
  secretsmanager create-secret \
    --name '/my-app/prd/secrets' \
    --secret-string '{"APP_USERNAME":"[username]","APP_PASSWORD":"[password]"}'

#
export KUBECTL_NAMESPACE='my-app'

cat << EOF | kubectl apply \
  -n "$KUBECTL_NAMESPACE" \
  -f -
apiVersion: kubernetes-client.io/v1
kind: ExternalSecret
metadata:
  name: my-app
spec:
  backendType: secretsManager
  data:
  - key: /my-app/prd/secrets
    name: APP_PASSWORD
    property: APP_PASSWORD
EOF

#
kubectl get externalsecret -A
```

> Wait a few minutes and verify that the associated `Secret` has been created.

```sh
#
kubectl get secret my-app -o yaml | \
  kubectl neat
```

<!--
envFrom:
- secretRef:
    name: my-app
-->

<!-- ### Issues

####

```log
ERROR, Invalid name. Must be a valid name containing alphanumeric characters, or any of the following: -/_+=.@!
```

TODO -->

### Delete

```sh
helm uninstall external-secrets \
  -n kube-system
```
