# Argo CD

## Helm

### References

- [Ingress Configuration](https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/ingress.md)

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- [Kubernetes TLS Secret](/k8s-tls-secret.md)

### Repository

```sh
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update argo
```

### Install

```sh
kubectl create namespace argo-cd
```

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n argo-cd
```

```sh
helm install argo/argo-cd \
  -n argo-cd \
  --namespace argo-cd \
  --set ingress.enabled=true \
  --set ingress.annotations."kubernetes\.io/ingress\.class"=nginx \
  --set-string ingress.annotations."nginx\.ingress\.kubernetes\.io/force-ssl-redirect"=true \
  --set ingress.annotations."nginx\.ingress\.kubernetes\.io/backend-protocol"='HTTPS' \
  --set ingress.hosts={argocd.$(minikube ip).nip.io}
```

```sh
kubectl patch ingress argocd-server \
  -p '{"spec":{"tls":[{"hosts":["argocd.$(minikube ip).nip.io"],"secretName":"example.tls-secret"}]}}' \
  -n argo-cd
```

### Status

```sh
kubectl rollout status deploy/argocd-server -n argo-cd
```

### Secrets

```sh
kubectl patch secret argocd-secret \
  -p '{"stringData":{"admin.password":"'$(htpasswd -bnBC 10 "" PaSSw0rd! | tr -d ':\n')'"}}' \
  -n argo-cd
```

### Delete

```sh
helm delete argo-cd --purge
kubectl delete namespace argo-cd --grace-period=0 --force

kubectl get crd -o json | jq -r '.items[] | select(.spec.group | contains("argoproj.io")) | .metadata.name' | xargs -n 1 kubectl delete crd
```
