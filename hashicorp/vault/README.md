# HashiCorp Vault

<!--
https://app.pluralsight.com/library/courses/getting-started-hashicorp-vault/table-of-contents
https://app.pluralsight.com/library/courses/managing-hashicorp-vault/table-of-contents
-->

## CLI

### Installation

#### Homebrew

```sh
brew install vault
```

## Helm

### References

- [Helm Repository](https://github.com/hashicorp/vault-helm)

### Repository

```sh
helm repo add hashicorp 'https://helm.releases.hashicorp.com'
helm repo update
```

### Dependencies

- [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

### Install

```sh
#
kubectl create namespace vault

#
export INGRESS_HOST='127.0.0.1'

#
helm install vault hashicorp/vault \
  --namespace vault \
  --version 0.14.0 \
  -f <(cat << EOF
injector:
  metrics:
    enabled: true

server:
  ingress:
    enabled: true
    hosts:
    - host: vault.${INGRESS_HOST}.nip.io

  ha:
    enabled: true
    raft:
      enabled: true
    disruptionBudget:
      maxUnavailable: 1
    config: |
      ui = true

      listener "tcp" {
        tls_disable = 1
        address = "[::]:8200"
        cluster_address = "[::]:8201"
      }
      storage "consul" {
        path = "vault"
        address = "consul-consul-server.consul:8500"
      }

      service_registration "kubernetes" {}

ui:
  enabled: true
EOF
)
```

### Status

```sh
kubectl rollout status deploy/vault-agent-injector \
  -n vault
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=vault' \
  -n vault \
  -f
```

### Delete

```sh
helm uninstall vault \
  -n vault

kubectl delete namespace vault \
  --grace-period=0 \
  --force
```
