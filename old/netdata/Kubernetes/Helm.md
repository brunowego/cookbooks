# Helm

## Namespace

```sh
kubectl create namespace kube-monitor
```

```sh
kubens kube-monitor
```

## Install

```sh
git clone https://github.com/netdata/helmchart.git netdata && cd "$_"
```

```sh
helm repo update

helm install ./ -n netdata \
  --set master.database.storageclass=nfs-slow \
  --set master.alarms.storageclass=nfs-slow
```

### Port Forward

```sh
kubectl port-forward svc/netdata --address 0.0.0.0 19999:19999 > /dev/null &
```

## Delete

```sh
helm del --purge netdata
```

```sh
kubectl delete pvc -l app=netdata
```
