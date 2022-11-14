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
- [Terraform Provider for ArgoCD](https://github.com/oboukili/terraform-provider-argocd)

## Guides

- [Status Badge](https://argoproj.github.io/argo-cd/user-guide/status-badge/)
- [Git Webhook Configuration](https://argoproj.github.io/argo-cd/operator-manual/webhook/)
- [Ingress Configuration](https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/ingress.md)

## Custom Resource (CR)

### Install

```sh
#
kubectl create ns argo-system

#
kubectl apply \
  -n argo-system \
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
  --address 0.0.0.0 \
  -n argo-system \
  8443:443

#
echo -e '[INFO]\thttps://127.0.0.1:8443'
```

| Login   | Password                                                                                      |
| ------- | --------------------------------------------------------------------------------------------- | ---------------- |
| `admin` | `kubectl get secret argocd-initial-admin-secret -n argo-system -o jsonpath='{.data.password}' | base64 -d; echo` |

### Uninstall

```sh
#
kubectl delete \
  -n argo-system \
  -f 'https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml'

#
kubectl delete ns argo
```

## Helm

### References

- [Values](https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd#chart-values)

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)

### Repository

```sh
helm repo add argo 'https://argoproj.github.io/argo-helm'
helm repo update
```

### Install

```sh
#
kubectl create ns argo-system

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install argo-cd argo/argo-cd \
  --namespace argo-system \
  --version 3.17.6 \
  -f <(cat << EOF
server:
  extraArgs:
  - --insecure

  ingress:
    enabled: true
    hosts:
    - argocd.${DOMAIN}
EOF
)
```

<!-- ####

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

```sh
#
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n argo-system

  --set ingress.annotations."kubernetes\.io/ingress\.class"=nginx \
  --set-string ingress.annotations."nginx\.ingress\.kubernetes\.io/force-ssl-redirect"=true \
  --set ingress.annotations."nginx\.ingress\.kubernetes\.io/backend-protocol"='HTTPS' \

#
kubectl patch ingress argocd-server \
  -p '{"spec":{"tls":[{"hosts":["argocd.${DOMAIN}"],"secretName":"example.tls-secret"}]}}' \
  -n argo-system
``` -->

### Status

```sh
kubectl rollout status deploy/argo-cd-argocd-server \
  -n argo-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=argo-cd' \
  -n argo-system \
  -f
```

### Secrets

```sh
kubectl get secret argocd-initial-admin-secret \
  -o jsonpath='{.data.password}' \
  -n argo-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall argo-cd \
  -n argo-system

kubectl delete ns argocd \
  --grace-period=0 \
  --force

kubectl get crd -o json | \
  jq -r '.items[] | select(.spec.group | contains("argoproj.io")) | .metadata.name' | \
    xargs -n 1 kubectl delete crd
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
  -L 'https://github.com/argoproj/argo-cd/releases/download/v2.1.2/argocd-darwin-amd64' \
  -o /usr/local/bin/argocd && \
    chmod +x /usr/local/bin/argocd
```

#### Linux Binary

```sh
curl \
  -L 'https://github.com/argoproj/argo-cd/releases/download/v2.1.2/argocd-linux-amd64' \
  -o /usr/local/bin/argocd && \
    chmod +x /usr/local/bin/argocd
```

#### Chocolatey

```sh
choco install argocd-cli
```

### Commands

```sh
argocd -h
```

### Usage

```sh
#
export ARGOCD_SERVER='127.0.0.1:8080'
export ARGOCD_OPTS='--grpc-web --insecure'

#
argocd login \
  --username '<username>' \
  --password '<password>' \
  "$ARGOCD_SERVER"

#
argocd context
argocd context 127.0.0.1:8443
argocd context [domain]
```

#### Account

```sh
#
argocd account get-user-info

#
argocd account update-password

#
argocd account list

#
argocd account can-i sync applications '*'
argocd account can-i update projects 'default'
argocd account can-i create clusters '*'
```

#### Cluster

```sh
#
argocd cluster list

#
argocd cluster add "$(kubectl config current-context)"
```

#### Certificates

```sh
#
argocd cert list
```

#### [Projects](https://github.com/argoproj/argo-cd/blob/master/docs/user-guide/projects.md)

```sh
#
argocd proj list
```

#### Repositories

```sh
#
argocd repo list
```

#### Applications

```sh
#
argocd app list

#
kubectl create ns [namespace]

# Using

## Kustomize
argocd app create \
  '[app-name]' \
  --repo '[git-repo]' \
  --path ./k8s/overlays/local \
  --dest-namespace '[namespace]' \
  --dest-server 'https://kubernetes.default.svc'

argocd app set '[app-name]' \
  --kustomize-image "$DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG"

## Or, Helm
argocd app create '[app-name]' \
  --repo '[git-repo]' \
  --path helm-guestbook \
  --dest-namespace '[namespace]' \
  --dest-server 'https://kubernetes.default.svc'
  --helm-set replicaCount=2

argocd app set '[app-name]' \
  -p "$DOCKER_REGISTRY/$DOCKER_REPOSITORY=$DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG"

#
argocd app sync '[app-name]' \
  --prune

#
argocd app wait '[app-name]'

#
argocd app history '[app-name]'

#
argocd app delete '[app-name]'
```

### Tips

#### Enable Status Badge

```sh
kubectl patch configmap argocd-cm \
  -p '{"data":{"statusbadge.enabled":"true"}}' \
  -n argo-system \
  --dry-run='server'
```

> More details about Status Badge [here](https://argoproj.github.io/argo-cd/user-guide/status-badge/).

### Issues

#### Known Hosts Key Mismatch

```log
FATA[0001] rpc error: code = InvalidArgument desc = application spec is invalid: InvalidSpecError: repository not accessible: ssh: handshake failed: knownhosts: key mismatch
```

- [ArgoCD Repositories](https://argocd.example.com/settings/repos)
- [GitHub's SSH key fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints)

```sh
#
ssh-keyscan -H github.com

#
kubectl get cm argocd-ssh-known-hosts-cm \
  -n argocd \
  -o jsonpath='{.data.ssh_known_hosts}'
```

1. "Settings" in Menu
2. "Repository certificates" in Cards
3. Click "Add SSH Known Hosts" Button
   - SSH Known hosts data: `github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=`

<!-- ####

```log
FATA[0000] rpc error: code = Unknown desc = account 'admin' does not have apiKey capability
```

```sh
export TOKEN_SECRET="$(kubectl get serviceaccount -n argo-system argocd -o jsonpath='{.secrets[0].name}')"
export TOKEN="$(kubectl get secret -n argo-system $TOKEN_SECRET -o jsonpath='{.data.token}' | base64 -d)"

export ARGOCD_AUTH_TOKEN=''
``` -->

<!-- export ARGOCD_INSECURE='true' -->

<!-- ####

```log
OrphanedResourceWarning
Application has 2 orphaned resources
```

TODO
-->

## Kubectl

### Usage

```sh
#
kubectl get appprojects \
  -n argo-system
```
