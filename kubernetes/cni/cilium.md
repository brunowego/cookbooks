# Cilium Networking

## Guides

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
helm install cilium cilium/cilium \
  --namespace kube-system \
  --version 1.9.10 \
  -f <(cat << EOF
nodeinit:
  enabled: true

kubeProxyReplacement: partial

hostServices:
  enabled: false

externalIPs:
  enabled: true

nodePort:
  enabled: true

hostPort:
  enabled: true

bpf:
  masquerade: false

image:
  pullPolicy: IfNotPresent

ipam:
  mode: kubernetes
EOF
)
```

### Hubble Relay

```sh
#
# export KUBERNETES_IP='127.0.0.1'
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
  #     - hubble.${DOMAIN}
EOF
))
```

### Status

```sh
kubectl rollout status deploy/cilium \
  -n kube-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=cilium' \
  -n kube-system \
  -f
```

### Tips

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

#### Outdated Kernel

```sh
cilium-2mcjx cilium-agent level=fatal msg="BPF NodePort services needs kernel 4.17.0 or newer." subsys=daemon
```

```sh
#
kubectl get nodes

#
kubectl node_shell [node-name] -- uname -r
```

**Note:** If using kOps, check the AWS AMI used by kOps Instance Group (IG).

### Delete

```sh
helm uninstall cilium \
  -n kube-system
```
