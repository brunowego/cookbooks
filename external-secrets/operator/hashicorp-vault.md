# HashiCorp Vault

## ClusterSecretStore

```sh
#
vault secrets enable -path=secret kv

#
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: Secret
metadata:
  name: vault-token
  namespace: eso-system
data:
  vault-token: $(echo -n '<vault-token>' | base64)
EOF

#
kubectl get secret vault-token \
  -o jsonpath='{.data.vault-token}' \
  -n eso-system | \
    base64 -d; echo

#
cat << EOF | kubectl apply -f -
---
apiVersion: external-secrets.io/v1beta1
kind: ClusterSecretStore
metadata:
  name: secretstore-vault
spec:
  provider:
    vault:
      server: http://vault.vault-system.svc.cluster.local:8200
      path: secret
      version: v1
      auth:
        tokenSecretRef:
          name: vault-token
          namespace: eso-system
          key: vault-token
EOF

#
kubectl get clustersecretstore
```

## ExternalSecret

```sh
#
vault kv put secret/foo my-value=bar

#
cat << EOF | kubectl apply -f -
---
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: vault-example
  namespace: default
spec:
  refreshInterval: '15s'
  secretStoreRef:
    name: secretstore-vault
    kind: ClusterSecretStore
  data:
  - secretKey: foo
    remoteRef:
      key: secret/foo
      property: my-value
EOF

#
kubectl get externalsecret -n default

#
kubectl get secret -n default

#
kubectl get secret vault-example \
  -o jsonpath='{.data.foo}' \
  -n default | \
    base64 -d; echo
```
