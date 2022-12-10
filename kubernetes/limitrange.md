# Kubernetes Limit Range

## CLI

### Usage

```sh
#
kubectl get limitranges -A

#
kubectl get limitrange limits \
  -n default \
  -o yaml | \
    kubectl neat
```

### Tips

#### Limit Range CR

```sh
cat << EOF | kubectl \
  -n [namespace] \
  -f -
---
apiVersion: v1
Kind: LimitRange
metadata:
  name: cpu-min-max-demo-lr
spec:
  limits:
  - default:
      cpu: 600m
      memory: 100Mi
    defaultRequest:
      cpu: 100m
      memory: 50Mi
    max:
      cpu: 1000m
      memory: 200Mi
    min:
      cpu: 10m
      memory: 10Mi
    type: Container
EOF
```
