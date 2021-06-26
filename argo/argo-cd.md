# Argo CD

<!--
https://blog.sebastian-daschner.com/entries/cloud-native-ci-cd-tekton-argocd-video-course
https://www.eksworkshop.com/intermediate/290_argocd/

https://www.udemy.com/course/hands-on-guide-to-argo-workflows-on-kubernetes/
-->

**Keywords:** Operator, GitOps

## Alternatives

- [Flux CD](/fluxcd.md)

## Links

- [Code Repository](https://github.com/argoproj/argo-cd)
- [Main Website](https://argoproj.github.io/)

## Guides

- [Status Badge](https://argoproj.github.io/argo-cd/user-guide/status-badge/)
- [Git Webhook Configuration](https://argoproj.github.io/argo-cd/operator-manual/webhook/)

## Resources Manifest

### Install

```sh
#
kubectl create namespace argocd

#
kubectl apply \
  -n argocd \
  -f 'https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml'

#
kubectl wait \
  --namespace argocd \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/name=argocd-application-controller \
  --timeout=90s

#
kubectl port-forward \
  svc/argocd-server \
  -n argocd \
  8443:443

#
echo -e '[INFO]\thttps://127.0.0.1:8443'
```

| Login | Password |
| --- | --- |
| `admin` | `kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d; echo` |

### Uninstall

```sh
#
kubectl delete \
  -n argocd \
  -f 'https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml'

#
kubectl delete namespace argo
```

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
  --set ingress.hosts={argocd.${INGRESS_HOST}.nip.io}
```

```sh
kubectl patch ingress argocd-server \
  -p '{"spec":{"tls":[{"hosts":["argocd.${INGRESS_HOST}.nip.io"],"secretName":"example.tls-secret"}]}}' \
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
  '127.0.0.1:8443'

#
argocd account update-password

#
argocd account can-i sync applications '*'
argocd account can-i update projects 'default'
argocd account can-i create clusters '*'

#
argocd context

#
argocd repo list
```

### Docs

#### Create App

```sh
#
kubectl create namespace [namespace]

#
argocd app create \
  '[app-name]' \
  --repo '[git-repo]' \
  --path ./k8s/overlays/local \
  --dest-namespace '[namespace]' \
  --dest-server 'https://kubernetes.default.svc'

#
argocd app delete '[app-name]'
```

## Kubectl

### Usage

```sh
#
kubectl get appprojects \
  -n argocd
```
