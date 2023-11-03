# Cilium Networking

## Guides

- [Docs](https://docs.cilium.io/en/v1.9/gettingstarted/kind/)
- [Troubleshooting](https://docs.cilium.io/en/v1.9/operations/troubleshooting/)

## Helm

### References

- [Helm Reference](https://docs.cilium.io/en/stable/helm-reference/)

### Repository

```sh
helm repo add cilium 'https://helm.cilium.io'
helm repo update
```

### Install

```sh
#
helm search repo -l cilium/cilium

#
helm upgrade cilium cilium/cilium \
  --namespace kube-system \
  --version 1.12.5 \
  -f <(cat << EOF
aksbyocni:
  enabled: true

# eni:
#   enabled: true

# externalIPs:
#   enabled: true

# nodePort:
#   enabled: true

# hostPort:
#   enabled: true

# image:
#   pullPolicy: IfNotPresent

# ipam:
#   # mode: eni
#   mode: kubernetes

nodeinit:
  enabled: true

global:
  kubeProxyReplacement: strict
EOF
)

#
kubectl get all -n kube-system
```

> Wait! This process take a while.

<!-- ### Hubble Relay

```sh
# export KUBERNETES_IP='<kubernetes-ip>'
# export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm upgrade cilium cilium/cilium \
  --namespace kube-system \
  -f <(yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' <(helm get values cilium -o yaml --namespace kube-system) <(cat << \EOF
hubble:
  relay:
    enabled: true
  # ui:
  #   ingress:
  #     enabled: true
  #     hosts:
  #     - hubble.${K8S_DOMAIN}
EOF
))
``` -->

### Status

```sh
kubectl rollout status deploy/cilium-operator \
  -n kube-system
```

### Logs

```sh
kubectl logs \
  -l 'io.cilium/app=operator' \
  -n kube-system \
  -f
```

<!-- ### Tips -->

<!-- #### Policy Trace

```sh
kubectl exec "$NODE1_CILIUM_POD" \
  -n kube-system \
    -- cilium policy trace \
      --src-identity 6 \
      --dst-identity 9560 \
      --dport 8053/UDP
``` -->

### Issues

#### TBD

```log
level=fatal msg="cluster-pool allocator is not supported by this version of cilium-operator-aws" subsys=cilium-operator-aws
```

TODO

#### Outdated Kernel

```sh
cilium-2mcjx cilium-agent level=fatal msg="BPF NodePort services needs kernel 4.17.0 or newer." subsys=daemon
```

```sh
#
kubectl get nodes

#
kubectl node_shell <node-name> -- uname -r
```

**Note:** If using kOps, check the AWS AMI used by kOps Instance Group (IG).

### Delete

```sh
helm uninstall cilium \
  -n kube-system
```
