# Kubernetes External Secrets

<!--
Reloader
-->

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

<!--
  template:
    stringData:
      dotenv: |
        <%= Object.entries(JSON.parse(data.s1)).map(e => e[0] + "=" + "'" + e[1] + "'").join("\n") %>
    metadata:
      annotations:
        argocd.argoproj.io/compare-options: IgnoreExtraneous
        reloader.stakater.com/match: "true"
-->

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

<!-- ### Tips

####

```sh
#
kubectl rollout restart deployment kubernetes-external-secrets \
  -n kube-system

#
kubectl get pods \
  -l app.kubernetes.io/name=kubernetes-external-secrets \
  -n kube-system
``` -->

### Force Sync

```sh
kubectl patch es '[name]' \
  --patch "{\"spec\":{\"template\":{\"metadata\":{ \"annotations\":{\"force-sync\":\"$(date +%s)\"}}}}}" \
  --type merge
```

### Issues

<!-- ####

```log
ERROR, Secrets Manager can't find the specified secret.
```

https://github.com/external-secrets/kubernetes-external-secrets/issues/428#issuecomment-657722350

TODO -->

<!-- ####

```log
kubernetes-external-secrets-777dbfb555-kkl4k kubernetes-external-secrets {"level":50,"message_time":"2021-09-30T22:44:06.692Z","pid":17,"hostname":"kubernetes-external-secrets-777dbfb555-kkl4k","payload":{"message":"Secrets Manager can't find the specified secret.","code":"ResourceNotFoundException","time":"2021-09-30T22:44:06.691Z","requestId":"7e66a243-6bf8-43d4-ba09-03cb858e2530","statusCode":400,"retryable":false,"retryDelay":99.50371757173153},"msg":"failure while polling the secret [namespace]/[my-secret]"}
```

TODO -->

#### Manual Creation

```sh
#
aws-secrets-dotenv \
  --aws-region 'us-east-1' \
  get \
    '[secret-id]' \
    -f ./.env

#
kubectl create secret generic [name] \
  -n [namespace] \
  --from-env-file=./.env

#
kubectl get secret [name] \
  -n [namespace] \
  -o yaml | \
    kubectl neat
```

#### Secret Not Sync

```sh
#
kubectl get externalsecrets \
  -n [namespace]

#
kubectl describe pod \
  -l 'app.kubernetes.io/name=kubernetes-external-secrets' \
  -n kube-system

#
kubectl delete pod \
  -l 'app.kubernetes.io/name=kubernetes-external-secrets' \
  -n kube-system
```

<!-- ####

```log
syscall":"connect","address":"100.64.0.1","port":443},"msg":"failure while updating status for externalsecret kube-system/cluster-autoscaler"}
Error: connect EHOSTUNREACH 100.64.0.1:443
    at TCPConnectWrap.afterConnect [as oncomplete] (net.js:1144:16) {
  errno: 'EHOSTUNREACH',
  code: 'EHOSTUNREACH',
  syscall: 'connect',
  address: '100.64.0.1',
  port: 443
}
```

TODO -->

### Delete

```sh
helm uninstall external-secrets \
  -n kube-system
```
