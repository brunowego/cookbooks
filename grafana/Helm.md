# Helm

##

```sh
kubens kube-monitor
```

##

```sh
helm repo update
helm install stable/grafana -n grafana
```

##

```sh
kubectl get secret grafana -o jsonpath='{.data.admin-password}' | base64 --decode; echo
```
