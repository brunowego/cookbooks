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

<!--
### Usage

```sh
#
vault server -config=/vault/config/vault.json

#
vault kv get secret/data/hello-service/credentials

#
vault kv put secret/hello foo=world
```
-->

## Helm

### References

- [Chart Repository](https://github.com/hashicorp/vault-helm)

### Repository

```sh
helm repo add hashicorp 'https://helm.releases.hashicorp.com'
helm repo update
```

### Install

```sh
#
kubectl create ns vault

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install vault hashicorp/vault \
  --namespace vault \
  --version 0.14.0 \
  -f <(cat << EOF
server:
  ingress:
    enabled: true
    hosts:
    - host: vault.${DOMAIN}

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

### Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
helm upgrade vault hashicorp/vault \
  --namespace vault \
  -f <(yq m <(cat << EOF
injector:
  metrics:
    enabled: true
EOF
) <(helm get values vault --namespace vault))
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

kubectl delete ns vault \
  --grace-period=0 \
  --force
```
