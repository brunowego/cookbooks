# RabbitMQ with Prometheus Stack

## Links

- [Grafana Dashboards](https://github.com/rabbitmq/cluster-operator/tree/main/observability/grafana/dashboards)

## Guides

- [Monitoring RabbitMQ in Kubernetes](https://rabbitmq.com/kubernetes/operator/operator-monitoring.html)

## Kubernetes

### Dependencies

- [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

### Monitor

#### Service

```sh
# RabbitMQ clusters
export KUBECTL_NAMESPACE='my-app'

cat << EOF | kubectl apply \
  -n "$KUBECTL_NAMESPACE" \
  -f -
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: rabbitmq
  labels:
    release: prometheus-stack
spec:
  selector:
    matchLabels:
      app.kubernetes.io/component: rabbitmq
  namespaceSelector:
    matchNames:
    - $KUBECTL_NAMESPACE
  endpoints:
  - port: prometheus
    interval: 15s
EOF

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
curl \
  --retry 3 \
  --retry-connrefused \
  --retry-max-time 60 \
  -sG \
  --data-urlencode 'match_target={job="rabbitmq"}' \
  "http://prometheus.${DOMAIN}/api/v1/targets/metadata" | \
    jq .status | \
      grep 'success'
```

#### Pod

```sh
#
cat << EOF | kubectl apply \
  -n rabbitmq-system \
  -f -
apiVersion: monitoring.coreos.com/v1
kind: PodMonitor
metadata:
  name: rabbitmq-cluster-operator
  labels:
    release: prometheus-stack
spec:
  selector:
    matchLabels:
      app.kubernetes.io/component: rabbitmq-operator
  namespaceSelector:
    matchNames:
    - rabbitmq-system
  podMetricsEndpoints:
  - port: metrics
EOF

#
curl \
  --retry 3 \
  --retry-connrefused \
  --retry-max-time 60 \
  -sG \
  --data-urlencode 'match_target={job="prometheus-kube-prometheus-alertmanager"}' \
  "http://prometheus.${DOMAIN}/api/v1/targets/metadata" | \
    jq .status | \
      grep 'success'
```

### Grafana Dashboards

```sh
#
kubectl logs \
  $(kubectl get pods -o jsonpath='{.items[0].metadata.name}' -l app.kubernetes.io/name=grafana -n monitoring) \
  -n monitoring \
  -f \
  grafana-sc-dashboard

# RabbitMQ Overview (https://grafana.com/grafana/dashboards/10991)
cat << EOF | kubectl apply \
  -n monitoring \
  -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: rabbitmq-overview-dashboard
  labels:
    grafana_dashboard: "true"
data:
  rabbitmq-overview-dashboard.json.url: https://grafana.com/api/dashboards/10991/revisions/11/download
EOF

# RabbitMQ Quorum Queues Raft (https://grafana.com/grafana/dashboards/11340)
cat << EOF | kubectl apply \
  -n monitoring \
  -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: rabbitmq-quorum-queues-raft-dashboard
  labels:
    grafana_dashboard: "true"
data:
  rabbitmq-quorum-queues-raft-dashboard.json.url: https://grafana.com/api/dashboards/11340/revisions/5/download
EOF
```
