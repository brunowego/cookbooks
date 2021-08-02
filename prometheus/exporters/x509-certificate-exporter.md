# X.509 Certificate Exporter for Prometheus

## Links

- [Code Repository](https://github.com/enix/x509-certificate-exporter)
- Grafana Dashboard
  - [Certificates Expiration (X509 Certificate Exporter)](https://grafana.com/grafana/dashboards/13922)
- Grafana Plugins
  - [Pie Chart](https://grafana.com/grafana/plugins/grafana-piechart-panel/)

## Helm

### References

- [Values](https://github.com/enix/helm-charts/tree/master/charts/x509-certificate-exporter#values)

### Repository

```sh
helm repo add enix 'https://charts.enix.io'
helm repo update
```

### Dependencies

- [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

### Install

```sh
helm install x509-certificate-exporter enix/x509-certificate-exporter \
  --namespace monitoring \
  --version 1.16.1 \
  -f <(cat << EOF
prometheusPodMonitor:
  create: true
EOF
)
```

### Status

```sh
kubectl rollout status deploy/x509-certificate-exporter \
  -n monitoring
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=x509-certificate-exporter' \
  -n monitoring \
  -f
```

### Port Forward

```sh
kubectl port-forward svc/x509-certificate-exporter-headless 9793:9793 \
  -n monitoring

#
echo -e '[INFO]\thttp://127.0.0.1:9793/metrics'
```

### Delete

```sh
helm uninstall x509-certificate-exporter \
  -n monitoring
```
