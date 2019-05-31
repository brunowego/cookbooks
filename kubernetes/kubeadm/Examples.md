# Examples

## Info

```sh
kubectl cluster-info
```

## Get

### Node

```sh
kubectl get nodes
```

### Pod

```sh
kubectl get pods --all-namespaces
```

##

```sh
kubeadm config images pull
```

##

```sh
kubectl get deploy --all-namespaces
```

## Services

```sh
kubectl get services --all-namespaces
```

##

```sh
kubectl get sc --all-namespaces
```

## Persistent Volumes

```sh
kubectl get pv
```

### Claims

```sh
kubectl get pvc
```

## Describe

```sh
kubectl describe pod -n [namespace] [name]
```

## Logs

```sh
kubectl logs -n [namespace] [name]
```

## Edit

```sh
kubectl edit pod -n [namespace] [name]
```

##

```sh
kubeadm token list | awk '{ print $1 }' | awk NR==2 > /vagrant/token
```

## Reset

```sh
sudo kubeadm reset -f
```

##

```sh
kubectl drain node1
```

##

```sh
kubectl delete node node1
```

##

```sh
kubectl get serviceaccount --all-namespaces
```

##

```sh
kubectl get clusterrolebinding --all-namespaces
```

##

```sh
kubectl get secrets --all-namespaces
```

##

```sh
export NO_PROXY=$no_proxy,$(minikube ip)

export no_proxy=$no_proxy,10.254.1.131
export NO_PROXY=$no_proxy
```

##

```sh
kubectl run --rm -i --tty fun --image quay.io/coreos/etcd --restart=Never -- /bin/sh
```

## Namespace

```sh
kubectl create ns [name]
```
