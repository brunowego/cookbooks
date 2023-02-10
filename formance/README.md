# Formance

## Links

- [Code Repository](https://github.com/formancehq/stack)
- [Main Website](https://formance.com)

## CLI

### Links

- [Code Repository](https://github.com/formancehq/fctl)

### Installation

#### Homebrew

```sh
brew tap formancehq/tap
brew install fctl
```

### Commands

```sh
fctl -h
```

### Initialize

```sh
#
fctl login

#
cat ~/.formance/fctl.config

#
fctl cloud me info
```

### Usage

```sh
#
fctl stack create foobar

#
fctl ledger send world foo 100 EUR/2 --ledger demo
fctl ledger stats

#
fctl ui

#
fctl auth clients list

#
fctl auth users list

#
fctl cloud

#
fctl payments connectors install

#
fctl profiles list

#
fctl prompt

#
fctl webhooks list
```

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# kbenv
source <(fctl completion zsh) # bash
```

```sh
source ~/.zshrc
```

<!-- ## Helm

### References

- [Values](https://github.com/formancehq/helm/tree/main/charts/stack#values)

### Repository

```sh
helm repo add formance 'https://helm.formance.com'
helm repo update
```

### Install

```sh
#
kubectl create ns formance

#
kubens formance

#
helm search repo -l formance/stack

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install stack formance/stack \
  --version 1.1.0 \
  -f <(cat << EOF
gateway:
control:
ledger:
payments:
search:

autoscaling:
  enabled: false

control:
  ingress:
    enabled: true
    className: nginx
    hosts:
      - host: formance.${DOMAIN}
        paths:
          - path: /
            pathType: ImplementationSpecific
EOF
)
```

### Status

```sh
kubectl rollout status deploy/formance
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=formance' \
  -f
```

### Secret

```sh
kubectl get secret formance \
  -o jsonpath='{.data.admin-password}' | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall formance

kubectl delete ns formance \
  --grace-period=0 \
  --force
``` -->
