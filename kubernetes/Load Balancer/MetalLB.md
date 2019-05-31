# MetalLB

```sh
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.7.3/manifests/metallb.yaml
```

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
      - name: custom-ip-space
        protocol: layer2
        addresses:
          - 192.168.1.16/28
EOF
```
