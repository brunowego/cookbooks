# MetalLB

## References

- [Cluster addresses](https://metallb.universe.tf/tutorial/layer2/#cluster-addresses)
- [Bare-metal considerations](https://github.com/kubernetes/ingress-nginx/blob/master/docs/deploy/baremetal.md)
- [Configuration](https://github.com/helm/charts/tree/master/stable/metallb#configuration)

## Helm

### Install

```sh
kubectl create namespace metallb-system
```

```sh
helm install stable/metallb \
  -n metallb \
  --namespace metallb-system
```

```sh
kubectl get nodes -o wide

# Vagrant
echo "$(hostname -I | awk '{print $2}')"
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: metallb-config
data:
  config: |
    address-pools:
      - name: default
        protocol: layer2
        addresses:
          - 192.168.1.240-192.168.1.250
EOF
```

```sh
kubectl get services -A
```

### Delete

```sh
kubectl delete configmap metallb-config -n metallb-system

helm delete metallb --purge
kubectl delete namespace metallb-system --grace-period=0 --force
```
