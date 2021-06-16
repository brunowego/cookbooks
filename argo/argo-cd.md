# Argo CD

<!--
https://blog.sebastian-daschner.com/entries/cloud-native-ci-cd-tekton-argocd-video-course
https://www.eksworkshop.com/intermediate/290_argocd/

https://www.udemy.com/course/hands-on-guide-to-argo-workflows-on-kubernetes/
-->

**Keywords:** Operator, GitOps

## Links

- [Main Website](https://argoproj.github.io/)

## Guides

- [Status Badge](https://argoproj.github.io/argo-cd/user-guide/status-badge/)

## Alternatives

- [Flux CD](/fluxcd.md)

## Helm

### References

- [Ingress Configuration](https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/ingress.md)

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- [Kubernetes TLS Secret](/k8s-tls-secret.md)

### Repository

```sh
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
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
helm install argo-cd argo/argo-cd \
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
helm uninstall argo-cd -n argo-cd
kubectl delete namespace argo-cd --grace-period=0 --force

kubectl get crd -o json | jq -r '.items[] | select(.spec.group | contains("argoproj.io")) | .metadata.name' | xargs -n 1 kubectl delete crd
```

## CLI

### Installation

#### Homebrew

```sh
brew install argocd
```

#### Darwin Binary

```sh
curl \
  -L 'https://github.com/argoproj/argo-cd/releases/download/v2.0.3/argocd-darwin-amd64' \
  -o /usr/local/bin/argocd && \
    chmod +x /usr/local/bin/argocd
```

### Commands

```sh
argocd -h
```

### Usage

```sh
#
argocd login \
  --grpc-web \
  --insecure \
  --username '<username>' \
  --password '<password>' \
  'argocd.example.com'

#
argocd account can-i sync applications '*'
argocd account can-i update projects 'default'
argocd account can-i create clusters '*'

#
argocd context

#
argocd repo list
```
