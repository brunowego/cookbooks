# Cost Analyzer

## Links

- [Code Repository](https://github.com/kubecost/cost-analyzer)

## Helm

### References

- [Chart Repository](https://github.com/kubecost/cost-analyzer-helm-chart/tree/develop/cost-analyzer)

### Repository

```sh
helm repo add kubecost 'https://kubecost.github.io/cost-analyzer'
helm repo update
```

### Dependencies

- [Grafana](/grafana/README.md#helm)
- [Prometheus](/prometheus/README.md#helm)

### Install

```sh
#
kubectl create ns kubecost
# kubectl create ns finops

#
kubens kubecost

#
helm search repo -l kubecost/cost-analyzer

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"
export KUBECOST_TOKEN="<token>" # http://kubecost.com/install

#
helm install kubecost kubecost/cost-analyzer \
  --version 1.103.2 \
  -f <(cat << EOF
global:
  # zone: cluster.local

  # prometheus:
  #   enabled: false
  #   fqdn: http://prometheus-server.prometheus.svc

  grafana:
    enabled: false
    # proxy: false
    # fqdn: grafana.monitoring.svc

  # alertmanager:
  #   enabled: true
  #   fqdn: http://prometheus-server.prometheus.svc

  gcpstore:
    enabled: false

kubecostToken: ${KUBECOST_TOKEN}

ingress:
  enabled: true
  hosts:
  - kubecost.${DOMAIN}
  className: nginx

# remoteWrite:
#   postgres:
#     enabled: true
#     auth:
#       password: admin

# networkCosts:
#   enabled: true
#   resources:
#     requests:
#      cpu: 50m
#      memory: 20Mi

# initChownData:
#   resources:
#     requests:
#      cpu: 50m
#      memory: 20Mi

kubecostProductConfigs:
  clusters:
  - name: Local
    address: http://kubecost-cost-analyzer.kubecost.svc:9090
  clusterProfile: development
  # clusterName: develop.my-cluster.k8s.local
  currencyCode: USD
EOF
)

#
helm status kubecost -n kubecost-system
```

<!--
kubectl edit cm nginx-conf -n kubecost-system
-->

```sh
kubectl rollout restart deployment \
  -n kubecost-system \
  kubecost-cost-analyzer
```

> Wait! This process take a while.

<!-- ### [Custom Prometheus](https://github.com/kubecost/docs/blob/master/custom-prom.md)

```sh
#
helm upgrade prometheus prometheus-community/prometheus \
  --namespace prometheus-system \
  -f <(yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' <(helm get values prometheus -o yaml --namespace prometheus-system) <(cat << \EOF
extraScrapeConfigs: |
  - job_name: kubecost
    honor_labels: true
    scrape_interval: 1m
    scrape_timeout: 10s
    metrics_path: /metrics
    scheme: http
    dns_sd_configs:
    - names:
      - kubecost-cost-analyzer.kubecost-system
      type: 'A'
      port: 9003
  - job_name: kubecost-networking
    kubernetes_sd_configs:
    - role: pod
    relabel_configs:
    # Scrape only the the targets matching the following metadata
    - source_labels: [__meta_kubernetes_pod_label_app]
      action: keep
      regex: kubecost-network-costs

rules:
  groups:
  - name: CPU
    rules:
    - expr: sum(rate(container_cpu_usage_seconds_total{container_name!=""}[5m]))
      record: cluster:cpu_usage:rate5m
    - expr: rate(container_cpu_usage_seconds_total{container_name!=""}[5m])
      record: cluster:cpu_usage_nosum:rate5m
    - expr: avg(irate(container_cpu_usage_seconds_total{container_name!="POD", container_name!=""}[5m])) by (container_name,pod_name,namespace)
      record: kubecost_container_cpu_usage_irate
    - expr: sum(container_memory_working_set_bytes{container_name!="POD",container_name!=""}) by (container_name,pod_name,namespace)
      record: kubecost_container_memory_working_set_bytes
    - expr: sum(container_memory_working_set_bytes{container_name!="POD",container_name!=""})
      record: kubecost_cluster_memory_working_set_bytes
  - name: Savings
    rules:
    - expr: sum(avg(kube_pod_owner{owner_kind!="DaemonSet"}) by (pod) * sum(container_cpu_allocation) by (pod))
      record: kubecost_savings_cpu_allocation
      labels:
        daemonset: "false"
    - expr: sum(avg(kube_pod_owner{owner_kind="DaemonSet"}) by (pod) * sum(container_cpu_allocation) by (pod)) / sum(kube_node_info)
      record: kubecost_savings_cpu_allocation
      labels:
        daemonset: "true"
    - expr: sum(avg(kube_pod_owner{owner_kind!="DaemonSet"}) by (pod) * sum(container_memory_allocation_bytes) by (pod))
      record: kubecost_savings_memory_allocation_bytes
      labels:
        daemonset: "false"
    - expr: sum(avg(kube_pod_owner{owner_kind="DaemonSet"}) by (pod) * sum(container_memory_allocation_bytes) by (pod)) / sum(kube_node_info)
      record: kubecost_savings_memory_allocation_bytes
      labels:
        daemonset: "true"
    - expr: label_replace(sum(kube_pod_status_phase{phase="Running",namespace!="kube-system"} > 0) by (pod, namespace), "pod_name", "$1", "pod", "(.+)")
      record: kubecost_savings_running_pods
    - expr: sum(rate(container_cpu_usage_seconds_total{container_name!="",container_name!="POD",instance!=""}[5m])) by (namespace, pod_name, container_name, instance)
      record: kubecost_savings_container_cpu_usage_seconds
    - expr: sum(container_memory_working_set_bytes{container_name!="",container_name!="POD",instance!=""}) by (namespace, pod_name, container_name, instance)
      record: kubecost_savings_container_memory_usage_bytes
    - expr: avg(sum(kube_pod_container_resource_requests{resource="cpu", unit="core", namespace!="kube-system"}) by (pod, namespace, instance)) by (pod, namespace)
      record: kubecost_savings_pod_requests_cpu_cores
    - expr: avg(sum(kube_pod_container_resource_requests{resource="memory", unit="byte", namespace!="kube-system"}) by (pod, namespace, instance)) by (pod, namespace)
      record: kubecost_savings_pod_requests_memory_bytes
EOF
))
``` -->

### Status

```sh
kubectl rollout status deploy/kubecost-cost-analyzer \
  -n kubecost-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=cost-analyzer' \
  -c cost-model \
  -n kubecost-system \
  -f

kubectl logs \
  -l 'app.kubernetes.io/name=cost-analyzer' \
  -c cost-analyzer-frontend \
  -n kubecost-system \
  -f
```

### Issues

#### Network Policy

```log
kubecost-cost-analyzer-67d54bb84f-9whcz cost-model I1008 17:33:47.481704       1 trace.go:205] Trace[1378634345]: "Reflector ListAndWatch" name:pkg/mod/k8s.io/client-go@v0.20.4/tools/cache/reflector.go:167 (08-Oct-2021 17:33:17.481) (total time: 30000ms):
kubecost-cost-analyzer-67d54bb84f-9whcz cost-model Trace[1378634345]: [30.000654745s] [30.000654745s] END
kubecost-cost-analyzer-67d54bb84f-9whcz cost-model E1008 17:33:47.481728       1 reflector.go:138] pkg/mod/k8s.io/client-go@v0.20.4/tools/cache/reflector.go:167: Failed to watch *v1.Node: failed to list *v1.Node: Get "https://100.64.0.1:443/api/v1/nodes?limit=500&resourceVersion=0": dial tcp 100.64.0.1:443: i/o timeout
```

Just, disable `networkPolicy`.

<!-- ```sh
#
kubens kubecost-system

#
kubectl get endpoints kubernetes -n default

#
kubectl get deployment kubecost-cost-analyzer \
  -o jsonpath='{.spec.template.spec.serviceAccountName}'; echo

#
kubectl get sa
kubectl get networkpolicies

#
kubectl auth can-i watch nodes \
  --as system:serviceaccount:kubecost-system:kubecost-cost-analyzer

kubectl auth can-i list nodes \
  --as system:serviceaccount:kubecost-system:kubecost-cost-analyzer

#
kubectl get services -n default

#
kubectl exec $(kubectl get pods -l 'app=cost-analyzer' -o jsonpath='{.items[0].metadata.name}' -n kubecost-system) \
  -c cost-analyzer-server \
  -n kubecost-system \
    -- nc -v kubernetes.default.svc 443

#
kubectl get clusterrole kubecost-cost-analyzer -o yaml
``` -->

### Delete

```sh
helm uninstall kubecost \
  -n kubecost-system

kubectl delete ns kubecost-system \
  --grace-period=0 \
  --force
```
