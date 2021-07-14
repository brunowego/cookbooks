# kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)

## Links

- [Code Repository](https://github.com/prometheus-operator/kube-prometheus)
- [Main Website](https://prometheus-operator.dev/)

## Helm

### References

- [Configuration](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack#configuration)

### Repository

```sh
helm repo add prometheus-community 'https://prometheus-community.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
export INGRESS_HOST='127.0.0.1'

#
kubectl create namespace monitoring
```

```sh
helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --version 16.12.1 \
  --set prometheus.ingress.enabled=true \
  --set prometheus.ingress.hosts="{prometheus.${INGRESS_HOST}.nip.io}" \
  --set prometheus.ingress.pathType=Prefix \
  --set alertmanager.ingress.enabled=true \
  --set alertmanager.ingress.hosts="{alertmanager.${INGRESS_HOST}.nip.io}" \
  --set alertmanager.ingress.pathType=Prefix \
  --set grafana.adminPassword="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" \
  --set grafana.ingress.enabled=true \
  --set grafana.ingress.hosts="{grafana.${INGRESS_HOST}.nip.io}"
```

### Status

```sh
kubectl rollout status deploy/prometheus-kube-prometheus-operator \
  -n monitoring
```

### Logs

```sh
kubectl logs \
  -l 'release=prometheus' \
  -n monitoring \
  -f
```

### Secret

```sh
#
kubectl get secret prometheus-grafana \
  -o jsonpath='{.data.admin-password}' \
  -n monitoring | \
    base64 --decode; echo
```

### Ingress

```sh
#
kubectl port-forward svc/prometheus-stack-kube-prom-prometheus \
  -n monitoring \
  9090:9090

#
echo -e '[INFO]\thttp://127.0.0.1:9090'
```

```sh
#
echo -e "[INFO]\thttp://prometheus.${INGRESS_HOST}.nip.io"

#
echo -e "[INFO]\thttp://alertmanager.${INGRESS_HOST}.nip.io"

#
echo -e "[INFO]\thttp://grafana.${INGRESS_HOST}.nip.io"
```

### Delete

```sh
helm uninstall prometheus \
  -n monitoring

kubectl delete namespace monitoring \
  --grace-period=0 \
  --force
```

### Tips

#### External Exporter

```sh
#
cat << EOF | kubectl apply \
  -n [namespace] \
  -f -
apiVersion: v1
kind: Endpoints
metadata:
  name: gpu-metrics
  labels:
    app.kubernetes.io/name: gpu-metrics
subsets:
- addresses:
  - ip: <gpu-machine-ip>
  ports:
  - name: metrics
    port: 9100
    protocol: TCP
EOF

#
cat << EOF | kubectl apply \
  -n [namespace] \
  -f -
apiVersion: v1
kind: Service
metadata:
  name: gpu-metrics-svc
  namespace: monitoring
  labels:
    app.kubernetes.io/name: gpu-metrics
spec:
  type: ExternalName
  externalName: <gpu-machine-ip>
  clusterIP: ""
  ports:
  - name: metrics
    port: 9100
    protocol: TCP
    targetPort: 9100
EOF

#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
cat << EOF | kubectl apply \
  -n [namespace] \
  -f -
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: gpu-metrics-sm
  labels:
    app.kubernetes.io/name: gpu-metrics
    release: prometheus
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: gpu-metrics
    namespaceSelector:
      matchNames:
      - monitoring
  endpoints:
  - port: metrics
    interval: 10s
    honorLabels: true
EOF
```

#### External MSK

```sh
#
cat << EOF | kubectl apply \
  -n [namespace] \
  -f -
apiVersion: v1
kind: Endpoints
metadata:
  name: msk-metrics
  labels:
    app.kubernetes.io/name: msk-metrics
subsets:
- addresses:
  - ip: <msk-machine-ip>
  ports:
  - name: jmx-exporter
    port: 11001
    protocol: TCP
  - name: node-exporter
    port: 11002
    protocol: TCP
EOF

#
cat << EOF | kubectl apply \
  -n [namespace] \
  -f -
apiVersion: v1
kind: Service
metadata:
  name: msk-metrics-svc
  labels:
    app.kubernetes.io/name: msk-metrics
spec:
  type: ExternalName
  externalName: <msk-machine-ip>
  clusterIP: ""
  ports:
  - name: jmx-exporter
    port: 11001
    protocol: TCP
    targetPort: 11001
  - name: node-exporter
    port: 11002
    protocol: TCP
    targetPort: 11002
EOF

#
cat << EOF | kubectl apply \
  -n [namespace] \
  -f -
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: msk-metrics-sm
  labels:
    app.kubernetes.io/name: msk-metrics
    release: prometheus
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: msk-metrics
  namespaceSelector:
    matchNames:
    - [namespace]
  endpoints:
  - port: jmx-exporter
    interval: 10s
    honorLabels: true
  - port: node-exporter
    interval: 10s
    honorLabels: true
EOF
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
