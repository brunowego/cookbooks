# AWS Secrets Manager

TODO

<!--
vault secrets enable aws
-->

<!--
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
---
apiVersion: kubernetes-client.io/v1
kind: ExternalSecret
metadata:
  name: my-app
spec:
  backendType: secretsManager
  dataFrom:
  - /my-app/prd/secrets
  data:
  - key: /my-app/prd/secrets
    name: APP_PASSWORD
    property: APP_PASSWORD
EOF

#
kubectl get externalsecret -A
```
-->

<!--
### Force Sync

```sh
kubectl patch es '[name]' \
  --patch "{\"spec\":{\"template\":{\"metadata\":{ \"annotations\":{\"force-sync\":\"$(date +%s)\"}}}}}" \
  --type merge
```

-->
