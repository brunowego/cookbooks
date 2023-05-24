# Prometheus Operator (a.k.a Kube Prometheus, p.k.a. Prometheus Stack)

<!--
https://github.com/jsa4000/Observable-Distributed-System/blob/master/docs/02_kube_prometheus.md
-->

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
kubectl create ns prometheus
# kubectl create ns metrics
# kubectl create ns observability

#
kubens prometheus

#
helm search repo -l prometheus-community/kube-prometheus-stack

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install prometheus-stack prometheus-community/kube-prometheus-stack \
  --version 45.3.0 \
  -f <(cat << EOF
alertmanager:
  enabled: false
  # ingress:
  #   enabled: true
  #   hosts:
  #     - alertmanager.${DOMAIN}
  #   pathType: Prefix

grafana:
  enabled: false
  # adminPassword: $(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)
  # ingress:
  #   enabled: true
  #   hosts:
  #     - grafana.${DOMAIN}

# prometheus:
#   prometheusSpec:
#      hostNetwork: true
#   ingress:
#     enabled: true
#     hosts:
#       - prometheus.${DOMAIN}
#     pathType: Prefix

# kubelet:
#   serviceMonitor:
#     metricRelabelings:
#       - action: replace
#         sourceLabels:
#           - node
#         targetLabel: instance

# prometheus-node-exporter:
#   hostNetwork: true
#   prometheus:
#     monitor:
#       metricRelabelings:
#         - action: replace
#           regex: (.*)
#           replacement: \$1
#           sourceLabels:
#             - __meta_kubernetes_pod_node_name
#           targetLabel: kubernetes_node
EOF
)
```

### Status

```sh
kubectl rollout status deploy/prometheus-stack-kube-prom-operator
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=prometheus-stack-kube-prom-prometheus' \
  -f
```

<!-- ### Secret

```sh
#
kubectl get secret prometheus-stack-grafana \
  -o jsonpath='{.data.admin-password}' | \
    base64 -d; echo
``` -->

### Port Forward

```sh
#
kubectl port-forward svc/prometheus-operated 9090:9090

#
echo -e '[INFO]\thttp://127.0.0.1:9090'

#
kubectl port-forward svc/prometheus-stack-kube-prom-prometheus 9090:9090

#
echo -e '[INFO]\thttp://127.0.0.1:9090'

#
kubectl port-forward svc/prometheus-stack-kube-prom-alertmanager 9093:9093

#
echo -e '[INFO]\thttp://127.0.0.1:9093'

#
kubectl port-forward svc/prometheus-stack-grafana 8080:80

#
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Ingress

```sh
#
echo -e "[INFO]\thttp://prometheus.${DOMAIN}"

#
echo -e "[INFO]\thttp://alertmanager.${DOMAIN}"

#
echo -e "[INFO]\thttp://grafana.${DOMAIN}"
```

### Tips

#### Backup

```sh
# Backup
kubectl cp \
  $(kubectl get pods -o jsonpath='{.items[0].metadata.name}' -l app.kubernetes.io/name=grafana):/var/lib/grafana/grafana.db \
  "$PWD"/grafana.db \
  -c grafana

# Restore
kubectl cp \
  "$PWD"/grafana.db \
  $(kubectl get pods -o jsonpath='{.items[0].metadata.name}' -l app.kubernetes.io/name=grafana):/var/lib/grafana/grafana.db \
  -c grafana
```

#### External Exporter

##### For Testing Propose

```sh
#
node_exporter \
  --web.listen-address=':9100'
```

##### Using ExternalName

```sh
#
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Endpoints
metadata:
  name: my-machine-metrics
  labels:
    app.kubernetes.io/component: my-machine-metrics
subsets:
- addresses:
  - ip: $(ip route get 1 | awk '{print $NF;exit}')
  ports:
  - name: metrics
    port: 9100
    protocol: TCP
EOF

#
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: my-machine-metrics
  labels:
    app.kubernetes.io/component: my-machine-metrics
spec:
  type: ExternalName
  externalName: $(ip route get 1 | awk '{print $NF;exit}')
EOF
```

##### Service Monitor

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}'

#
cat << EOF | kubectl apply -f -
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: my-machine-metrics
  labels:
    release: prometheus-stack
spec:
  selector:
    matchLabels:
      app.kubernetes.io/component: my-machine-metrics
  namespaceSelector:
    matchNames:
    - $(kubens -c)
  endpoints:
  - port: metrics
    interval: 15s
    path: /metrics
EOF
```

> Wait! This process take a while.

```sh
#
echo -e "[INFO]\thttp://prometheus.${DOMAIN}/service-discovery"
echo -e "[INFO]\thttp://prometheus.${DOMAIN}/config"
```

#### AWS NLB

```sh
#
kubectl patch svc prometheus-stack-kube-prom-prometheus \
  -p '{"spec":{"type":"LoadBalancer"}}'

#
kubectl annotate svc prometheus-stack-kube-prom-prometheus \
  service.beta.kubernetes.io/aws-load-balancer-internal='true' \
  service.beta.kubernetes.io/aws-load-balancer-type='nlb' \
  external-dns.alpha.kubernetes.io/hostname='prometheus.xyz.tld'

#
kubectl get service prometheus-stack-kube-prom-prometheus
```

### Alerts

TODO

<!-- #### TargetDown

TODO -->

<!-- #### NodeClockNotSynchronising

```log
Clock on {{ $labels.instance }} is not synchronising. Ensure NTP is configured on this host.
```

```sh
#
kubectl get nodes -o wide
``` -->

<!-- #### KubeScheduler

```log
KubeScheduler has disappeared from Prometheus target discovery.
``` -->

### Issues

#### Forbidden: may not be used when `type` is 'ClusterIP'

```log
Error: UPGRADE FAILED: cannot patch "prometheus-kube-prometheus-prometheus" with kind Service: Service "prometheus-kube-prometheus-prometheus" is invalid: spec.ports[0].nodePort: Forbidden: may not be used when `type` is 'ClusterIP'
```

```sh
kubectl delete service prometheus-kube-prometheus-prometheus
```

#### Timeout with ELB

```log
Error: rendered manifests contain a resource that already exists. Unable to continue with install: could not get information about the resource: Get "https://mycluster.elb.us-east-1.amazonaws.com/apis/apps/v1/namespaces/monitoring/deployments/prometheus-kube-state-metrics": dial tcp: lookup mycluster.elb.us-east-1.amazonaws.com on 8.8.8.8:53: read udp 192.168.0.101:59986->8.8.8.8:53: i/o timeout
helm.go:81: [debug] Get "https://mycluster.elb.us-east-1.amazonaws.com/apis/apps/v1/namespaces/monitoring/deployments/prometheus-kube-state-metrics": dial tcp: lookup mycluster.elb.us-east-1.amazonaws.com on 8.8.8.8:53: read udp 192.168.0.101:59986->8.8.8.8:53: i/o timeout
```

```sh
helm install prometheus-stack prometheus-community/kube-prometheus-stack \
  --version 16.12.0
  --timeout 30m \
  --wait \
  --debug
```

### Delete

```sh
helm uninstall prometheus-stack

kubectl delete ns prometheus \
  --grace-period=0 \
  --force
```
