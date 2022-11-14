# MetalLB

## References

- [Cluster addresses](https://metallb.universe.tf/tutorial/layer2/#cluster-addresses)
- [Bare-metal considerations](https://github.com/kubernetes/ingress-nginx/blob/master/docs/deploy/baremetal.md)
- [Configuration](https://github.com/helm/charts/tree/master/stable/metallb#configuration)

## Custom Resource (CR)

### Install

```sh
#
kubectl apply \
  -f 'https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/namespace.yaml'

#
kubectl create secret generic \
  -n metallb-system \
  memberlist \
  --from-literal=secretkey="$(openssl rand -base64 128)"

#
kubectl apply \
  -f 'https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/metallb.yaml'

#
cat << EOF | kubectl apply -f -
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

### Delete

```sh
kubectl delete \
  -f 'https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/metallb.yaml'

#
kubectl delete \
  -f 'https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/namespace.yaml'
```

## Helm

### Install

```sh
#
kubectl create ns metallb-system

#
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
kubectl delete ns metallb-system --grace-period=0 --force
```
