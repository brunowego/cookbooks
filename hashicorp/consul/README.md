# HashiCorp Consul

## Helm

### References

- [Helm Repository](https://github.com/hashicorp/consul-helm)

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
kubectl create namespace consul

#
export INGRESS_HOST='127.0.0.1'

#
helm upgrade consul hashicorp/consul \
  --namespace consul \
  --version 0.32.1 \
  -f <(cat << EOF
global:
  metrics:
    enabled: true

server:
  enabled: true

dns:
  enabled: true

ui:
  enabled: true
  ingress:
    enabled: true
    hosts:
    - host: consul.${INGRESS_HOST}.nip.io
      paths:
      - /
  metrics:
    enabled: true
EOF
)
```

### Status

```sh
kubectl rollout status statefulset/consul-consul-server \
  -n consul
```

### Logs

```sh
kubectl logs \
  -l 'app=consul' \
  --max-log-requests 6 \
  -n consul \
  -f
```

### Delete

```sh
helm uninstall consul \
  -n consul

kubectl delete namespace consul \
  --grace-period=0 \
  --force
```
