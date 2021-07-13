# MetalLB

## References

- [Cluster addresses](https://metallb.universe.tf/tutorial/layer2/#cluster-addresses)
- [Bare-metal considerations](https://github.com/kubernetes/ingress-nginx/blob/master/docs/deploy/baremetal.md)
- [Configuration](https://github.com/helm/charts/tree/master/stable/metallb#configuration)

## Resource Manifest

### Install

```sh
#
kubectl apply \
  -f 'https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml'

#
kubectl create secret generic \
  -n metallb-system \
  memberlist \
  --from-literal=secretkey="$(openssl rand -base64 128)"

#
kubectl apply \
  -f 'https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml'

#
cat << EOF | kubectl apply -f
apiVersion: v1
kind: ConfigMap
metadata:
  name: config
  namespace: metallb-system
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 172.18.0.155-172.18.0.200
EOF
```

## Helm

### Install

```sh
kubectl create namespace metallb-system
```

```sh
helm install metallb stable/metallb \
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

helm uninstall metallb -n metallb
kubectl delete namespace metallb-system --grace-period=0 --force
```
