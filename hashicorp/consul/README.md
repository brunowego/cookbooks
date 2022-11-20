# HashiCorp Consul

## Links

- [Code Repository](https://github.com/hashicorp/consul)
- [Main Website](https://consul.io/)

## Helm

### References

- [Chart Repository](https://github.com/hashicorp/consul-k8s/tree/main/charts/consul)

### Repository

```sh
helm repo add hashicorp 'https://helm.releases.hashicorp.com'
helm repo update
```

### Install

```sh
#
kubectl create ns consul-system

#
helm search repo -l hashicorp/consul

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install consul hashicorp/consul \
  --namespace consul-system \
  --version 0.49.1 \
  -f <(cat << EOF
server:
  enabled: true
  affinity: null

dns:
  enabled: true

ui:
  enabled: true
  ingress:
    enabled: true
    hosts:
    - host: consul.${DOMAIN}
      paths:
      - /
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
helm upgrade consul hashicorp/consul \
  --namespace consul-system \
  -f <(yq m <(cat << EOF
global:
  metrics:
    enabled: true

ui:
  metrics:
    enabled: true
EOF
) <(helm get values consul --namespace consul))
```

### Status

```sh
kubectl rollout status statefulset/consul-consul-server \
  -n consul-system
```

### Logs

```sh
kubectl logs \
  -l 'app=consul' \
  --max-log-requests 6 \
  -n consul-system \
  -f
```

### Delete

```sh
helm uninstall consul \
  -n consul-system

kubectl delete ns consul-system \
  --grace-period=0 \
  --force
```
