# HashiCorp Vault

<!--
https://app.pluralsight.com/library/courses/getting-started-hashicorp-vault/table-of-contents
https://app.pluralsight.com/library/courses/managing-hashicorp-vault/table-of-contents
-->

<!--
https://developer.hashicorp.com/vault/tutorials/auth-methods/oidc-auth
-->

**Keywords:** Secrets Manager

## Links

- [Code Repository](https://github.com/hashicorp/vault)
- [Main Website](https://vaultproject.io/)

## CLI

### Installation

#### Homebrew

```sh
brew install vault
```

### Commands

```sh
vault -h
```

### Authenticate

```sh
#
export VAULT_ADDR='http://0.0.0.0:8200'

#
vault login

#
vault auth list -detailed
```

### Secrets Engine

```sh
#
vault secrets list

#
vault secrets enable -path=kv kv
```

<!--
https://github.com/zippoobbiz/hashicorp-vault-practice/blob/master/basic-operations/6.%20auth%20method.md
-->

<!-- ###

```sh
#
vault policy list
``` -->

<!-- ###

```sh
#
vault auth enable kubernetes
``` -->

<!-- ####

```sh
#
vault auth enable userpass

#
vault write auth/userpass/users/brunowego password='Pa$$w0rd!' policies=oss-admin

#
vault list auth/userpass/users

#
vault login -method=userpass username=brunowego password='Pa$$w0rd!'

#
vault kv list /oss
vault kv get /oss/database
``` -->

<!-- ### Usage

```sh
#
vault list secret/
``` -->

## Helm

### References

- [Chart Repository](https://github.com/hashicorp/vault-helm)

### Repository

```sh
helm repo add hashicorp 'https://helm.releases.hashicorp.com'
helm repo update
```

### Dependencies

- [HashiCorp Consul](/hashicorp/consul/README.md#helm)

### Install

```sh
#
kubectl create ns vault-system
# kubectl create ns security

#
helm search repo -l hashicorp/vault

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install vault hashicorp/vault \
  --namespace vault-system \
  --version 0.22.1 \
  -f <(cat << EOF
injector:
  affinity: null

server:
  ingress:
    enabled: true
    hosts:
    - host: vault.${DOMAIN}

  affinity: null

  # ha:
  #   enabled: true
  #   raft:
  #     enabled: true
  #   config: |
  #     ui = true

  #     listener "tcp" {
  #       tls_disable = 1
  #       address = "[::]:8200"
  #       cluster_address = "[::]:8201"
  #     }

  #     storage "consul" {
  #       path = "vault"
  #       address = "consul-consul-server.consul-system:8500"
  #     }

  #     service_registration "kubernetes" {}
  #   disruptionBudget:
  #     maxUnavailable: 1

ui:
  enabled: true
EOF
)

#
kubectl get all -n vault-system
```

### Unseal

```sh
# Save Unseal Keys and Initial Root Token
kubectl exec -it vault-0 -n vault-system -- vault operator init

# Repeat this process 3 times with different unseal keys
kubectl exec -it vault-0 -n vault-system -- vault operator unseal

# Check if everything is ok
kubectl exec -it vault-0 -n vault-system -- vault status
```

<!-- ### Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
helm upgrade vault hashicorp/vault \
  --namespace vault-system \
  -f <(yq m <(cat << EOF
injector:
  metrics:
    enabled: true
EOF
) <(helm get values vault --namespace vault))
``` -->

### Status

```sh
kubectl rollout status deploy/vault-agent-injector \
  -n vault-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=vault-agent-injector' \
  -n vault-system \
  -f

kubectl logs \
  -l 'app.kubernetes.io/name=vault' \
  -n vault-system \
  -f
```

### Token

```sh
export VAULT_SECRET_NAME=$(kubectl get sa vault -o jsonpath="{.secrets[*]['name']}" -n vault-system)

kubectl get secret "$VAULT_SECRET_NAME" \
  -o jsonpath='{.data.token}' \
  -n vault-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall vault \
  -n vault-system

kubectl delete ns vault-system \
  --grace-period=0 \
  --force
```
