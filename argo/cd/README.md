# Argo CD

<!--
https://blog.sebastian-daschner.com/entries/cloud-native-ci-cd-tekton-argocd-video-course
https://www.eksworkshop.com/intermediate/290_argocd/

https://www.udemy.com/course/hands-on-guide-to-argo-workflows-on-kubernetes/
-->

**Keywords:** Continuous Delivery / Continuous Deployment, GitOps

## Links

- [Code Repository](https://github.com/argoproj/argo-cd)
- [Main Website](https://argoproj.github.io/)
- [Terraform Provider for ArgoCD](https://github.com/oboukili/terraform-provider-argocd)
- Docs
  - [Git Webhook Configuration](https://argo-cd.readthedocs.io/en/stable/operator-manual/webhook/)
  - [SSO](https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/#sso)
  - [Status Badge](https://argo-cd.readthedocs.io/en/stable/user-guide/status-badge/)

## Guides

- [Ingress Configuration](https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/ingress.md)

## Custom Resource (CR)

### Install

```sh
#
kubectl create ns argocd-system
# kubectl create ns pipeline

#
kubectl apply \
  -n argocd-system \
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
  -n argocd-system \
  8443:443

#
echo -e '[INFO]\thttps://127.0.0.1:8443'
```

| Login   | Password                                                                                        |
| ------- | ----------------------------------------------------------------------------------------------- | ---------------- |
| `admin` | `kubectl get secret argocd-initial-admin-secret -n argocd-system -o jsonpath='{.data.password}' | base64 -d; echo` |

### Uninstall

```sh
#
kubectl delete \
  -n argocd-system \
  -f 'https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml'

#
kubectl delete ns argo
```

## Helm

### References

- [Parameters](https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd#general-parameters)

### Repository

```sh
helm repo add argo 'https://argoproj.github.io/argo-helm'
helm repo update
```

### Install

```sh
#
kubectl create ns argocd
# kubectl create ns gitops

#
kubens argocd

#
helm search repo -l argo/argo-cd

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install argo-cd argo/argo-cd \
  --version 5.19.11 \
  -f <(cat << EOF
configs:
  params:
    server.insecure: true

server:
  ingress:
    enabled: true
    ingressClassName: nginx
    hosts:
      - argocd.${DOMAIN}
EOF
)
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/argo-cd-argocd-server \
  8080:80
-->

### Status

```sh
kubectl rollout status deploy/argo-cd-argocd-server
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=argo-cd' \
  --max-log-requests 7 \
  -f
```

### Secrets

<!--
username: admin
-->

```sh
#
kubectl get secret argocd-initial-admin-secret \
  -o jsonpath='{.data.password}' | \
    base64 -d; echo
```

### Issues

#### Too Many Redirects

<!--
https://pet2cattle.com/2022/03/argocd-redirect-loop
-->

```log
curl: (47) Maximum (50) redirects followed
```

TODO

```sh
#
curl -I argocd.domain.tld
```

```yml
server:
  ingress:
    # ...

    annotations:
      nginx.ingress.kubernetes.io/backend-protocol: HTTPS

    https: true
```

#### TBD

```log
time="2023-01-28T19:16:15Z" level=info msg="finished unary call with code Unauthenticated" error="rpc error: code = Unauthenticated desc = no session information" grpc.code=Unauthenticated grpc.method=List grpc.service=cluster.ClusterService grpc.start_time="2023-01-28T19:16:15Z" grpc.time_ms=7.078 span.kind=server system=grpc
time="2023-01-28T19:16:15Z" level=info msg="finished unary call with code Unauthenticated" error="rpc error: code = Unauthenticated desc = no session information" grpc.code=Unauthenticated grpc.method=List grpc.service=application.ApplicationService grpc.start_time="2023-01-28T19:16:15Z" grpc.time_ms=7.344 span.kind=server system=grpc
```

TODO

### Delete

```sh
helm uninstall argo-cd

kubectl delete ns argocd \
  --grace-period=0 \
  --force
```

<!--
kubectl get crd -o json | \
  jq -r '.items[] | select(.spec.group | contains("argoproj.io")) | .metadata.name' | \
    xargs -n 1 kubectl delete crd
-->

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
export ARGOCD_USER='<username>'
export ARGOCD_PASS='<password>'

#
argocd login \
  --username "$ARGOCD_USER" \
  --password "$ARGOCD_PASS" \
  "$ARGOCD_SERVER"

#
argocd context
argocd context '<domain>'
```

#### Account

```sh
#
argocd account list

#
argocd account get-user-info

#
argocd account update-password

#
argocd account can-i sync applications '*'
argocd account can-i update projects 'default'
argocd account can-i create clusters '*'

#
argocd account generate-token
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

### Tips

#### GnuPG Public Key

1. Settings
2. GnuPG keys -> ADD GNUPG KEY

#### Enable Status Badge

```sh
kubectl patch configmap argocd-cm \
  -p '{"data":{"statusbadge.enabled":"true"}}' \
  -n argocd-system \
  --dry-run='server'
```

> More details about Status Badge [here](https://argoproj.github.io/argo-cd/user-guide/status-badge/).

### Issues

#### TBD

```log
Unable to create application: application spec for storybook is invalid: InvalidSpecError: application destination {https://kubernetes.default.svc platform} is not permitted in project 'storybook'
```

TODO

#### Known Hosts Key Mismatch

```log
FATA[0001] rpc error: code = InvalidArgument desc = application spec is invalid: InvalidSpecError: repository not accessible: ssh: handshake failed: knownhosts: key mismatch
```

- [ArgoCD Repositories](https://argocd.domain.tld/settings/repos)
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
export TOKEN_SECRET="$(kubectl get serviceaccount -n argocd-system argocd -o jsonpath='{.secrets[0].name}')"
export TOKEN="$(kubectl get secret -n argocd-system $TOKEN_SECRET -o jsonpath='{.data.token}' | base64 -d)"

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
  -n argocd-system
```
