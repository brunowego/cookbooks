# Infra

**Keywords:** Bastion Host, IAP

## Links

- [Code Repository](https://github.com/infrahq/infra)
- [Main Website](https://infrahq.com/)

## Glossary

- Infrastructure Access Platform (IAP)

## CLI

### Installation

#### Homebrew

```sh
brew tap infrahq/tap
brew install infra
```

#### Scoop

```sh
scoop bucket add infrahq https://github.com/infrahq/scoop.git
scoop install infra
```

### Commands

```sh
infra -h
```

### Configuration

```sh
#
export INFRA_SERVER='<org>.infrahq.com'
export INFRA_ACCESS_KEY="$(infra keys add --connector -q)"

#
infra login --skip-tls-verify

#
infra info
```

### Usage

```sh
#
infra list

#
infra destinations list

#
infra use <destination>

#
infra grants list

#
infra users list

#
infra groups list

#
infra keys list

#
infra providers list

#
infra logout
```

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Infra
source <(infra completion zsh) # bash
```

```sh
source ~/.zshrc
```

## Helm

### References

- [Chart Repository](https://github.com/infrahq/infra/tree/main/helm/charts/infra)

### Repository

```sh
helm repo add infrahq 'https://helm.infrahq.com'
helm repo update
```

### Install

```sh
#
kubectl create ns infra-system
# kubectl create ns security

#
helm search repo -l infrahq/infra

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm upgrade infra infrahq/infra \
  --namespace infra-system \
  --version 0.20.9 \
  -f <(cat << EOF
server:
  service:
    type: ClusterIP

  ingress:
    enabled: true
    className: nginx
    hosts:
      - infra.${DOMAIN}

  config:
    grants:
      - user: admin@example.com
        role: admin
        resource: infra
      - user: admin@example.com
        role: edit
        resource: kubernetes.minikube

    users:
      - name: admin@example.com
        password: admin
EOF
)

#
kubectl get all -n infra-system
```

### Status

```sh
kubectl rollout status deployment/infra-server \
  -n infra-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=infra,app.kubernetes.io/name=infra-server' \
  -n infra-system \
  -f
```

### Secret

```sh
kubectl get secret infra-server-encryption-key \
  -o jsonpath='{.data.key}' \
  -n infra-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall infra \
  -n infra-system

kubectl delete ns infra-system \
  --grace-period=0 \
  --force
```
