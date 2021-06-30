# kube-prometheus

## Links

- [Code Repository](https://github.com/prometheus-operator/kube-prometheus)
- [Main Website](https://prometheus-operator.dev/)

## Helm

### References

- [Configuration](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack#configuration)

### Repository

```sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

### Install

```sh
kubectl create namespace monitoring
```

```sh
helm install prometheus prometheus-community/kube-prometheus-stack \
  -n monitoring \
  --version 16.12.0
```

### Delete

```sh
helm uninstall prometheus \
  -n monitoring

kubectl delete namespace monitoring \
  --grace-period=0 \
  --force
```

### Issues

#### Timeout with ELB

```log
Error: rendered manifests contain a resource that already exists. Unable to continue with install: could not get information about the resource: Get "https://mycluster.elb.us-east-1.amazonaws.com/apis/apps/v1/namespaces/monitoring/deployments/prometheus-kube-state-metrics": dial tcp: lookup mycluster.elb.us-east-1.amazonaws.com on 8.8.8.8:53: read udp 192.168.0.101:59986->8.8.8.8:53: i/o timeout
helm.go:81: [debug] Get "https://mycluster.elb.us-east-1.amazonaws.com/apis/apps/v1/namespaces/monitoring/deployments/prometheus-kube-state-metrics": dial tcp: lookup mycluster.elb.us-east-1.amazonaws.com on 8.8.8.8:53: read udp 192.168.0.101:59986->8.8.8.8:53: i/o timeout
```

```sh
helm install prometheus prometheus-community/kube-prometheus-stack \
  -n monitoring \
  --version 16.12.0
  --timeout 30m \
  --wait \
  --debug
```
