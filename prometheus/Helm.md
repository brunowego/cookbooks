# Helm

##

```sh
kubectl create ns kube-monitor
```

```sh
kubens kube-monitor
```

##

```sh
helm repo update
helm install stable/prometheus -n prometheus
```

##

```sh
helm repo update
helm install stable/prometheus-operator -n prometheus-operator
```
