# HashiCorp Vault

## ClusterSecretStore

```sh
#
kubectl get clustersecretstore

#
kubens eso-system

#
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: Secret
metadata:
  name: vault-token
data:
  vault-token: $(echo -n '<vault-token>' | base64)
EOF

#
kubectl get secret vault-token \
  -o jsonpath='{.data.vault-token}' | \
    base64 -d; echo

#
cat << EOF | kubectl apply -f -
---
apiVersion: external-secrets.io/v1beta1
kind: ClusterSecretStore
metadata:
  name: vault-secret-store
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
```

## ExternalSecret

```sh
#
vault secrets enable -path=secret kv

#
vault kv put secret/foo my-value=bar

#
kubens default

#
cat << EOF | kubectl apply -f -
---
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: vault-example
spec:
  refreshInterval: '15s'
  secretStoreRef:
    name: vault-secret-store
    kind: ClusterSecretStore
  data:
  - secretKey: foo
    remoteRef:
      key: secret/foo
      property: my-value
EOF

#
kubectl get externalsecret

#
kubectl get secret

#
kubectl get secret vault-example \
  -o jsonpath='{.data.foo}' | \
    base64 -d; echo
```
