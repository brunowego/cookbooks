# AWS Secrets Manager

## ClusterSecretStore

```sh
#
kubens vault-system

#
cat << EOF | kubectl apply -f -
---
apiVersion: external-secrets.io/v1beta1
kind: ClusterSecretStore
metadata:
  name: aws-secret-store
spec:
  provider:
    aws:
      service: SecretsManager
      region: us-east-1
      auth:
        jwt:
          serviceAccountRef:
            name: ${var.service_account_name}
            namespace: ${var.namespace}
        # secretRef:
        #   accessKeyIDSecretRef:
        #     name: external-secrets
        #     key: access-key
        #     namespace: database
        #   secretAccessKeySecretRef:
        #     name: external-secrets
        #     key: secret-access-key
        #     namespace: database

EOF

#
kubectl get clustersecretstore
```

## ExternalSecret

```sh
#
aws \
  --output json \
  secretsmanager list-secrets | \
  jq .

#
aws \
  --region 'us-east-1' \
  secretsmanager create-secret \
    --name '/my-app/prd/secrets' \
    --secret-string '{"APP_USERNAME":"user","APP_PASSWORD":"pass"}'

#
kubens default

#
cat << EOF | kubectl apply -f -
---
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: my-app
spec:
  refreshInterval: 15s
  secretStoreRef:
    name: aws-secret-store
    kind: ClusterSecretStore
  target:
    name: app-secret
    creationPolicy: Owner
  dataFrom:
  - extract:
      key: db-credentials-secret
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

<!-- ## Tips -->

<!-- ### Force Sync

```sh
kubectl patch es '[name]' \
  --patch "{\"spec\":{\"template\":{\"metadata\":{ \"annotations\":{\"force-sync\":\"$(date +%s)\"}}}}}" \
  --type merge
``` -->
