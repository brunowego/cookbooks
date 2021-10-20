# Logging Operator

## Links

- [Code Repository](https://github.com/banzaicloud/logging-operator)
- [Main Website](https://banzaicloud.com/products/logging-operator/)
- [Grafana Dashboard](https://grafana.com/grafana/dashboards/7752)
- [Logging Extensions](https://banzaicloud.com/docs/one-eye/logging-extensions/)

## Guides

- [Quickstarts](https://github.com/banzaicloud/logging-operator-docs/tree/master/docs/quickstarts)
- [FluentBit](https://banzaicloud.com/docs/one-eye/logging-operator/configuration/fluentbit/)
- [Tail](https://github.com/fluent/fluent-bit-docs/blob/1.3/input/tail.md)

## Configuration

- [Log Routing](https://github.com/banzaicloud/logging-operator-docs/blob/master/docs/configuration/log-routing.md)

## Videos

- [Logging Operator the Cloud Native Fluent Ecosystem - Sandor Guba, Cisco](https://www.youtube.com/watch?v=uWc7FgoBL60)

## Helm

### References

- [Configuration](https://github.com/banzaicloud/logging-operator/tree/master/charts/logging-operator#configuration)

### Repository

```sh
helm repo add banzaicloud-stable 'https://kubernetes-charts.banzaicloud.com'
helm repo update
```

### Install

```sh
#
kubectl create ns logging-system

#
helm install logging-operator banzaicloud-stable/logging-operator \
  --namespace logging-system \
  --version 3.14.2 \
  -f <(cat << EOF
resources:
  requests:
    cpu: 100m
    memory: 128Mi
  limits:
    cpu: 150m
    memory: 256Mi
EOF
)
```

<!--
createCustomResource: true
-->

### Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
helm upgrade logging-operator banzaicloud-stable/logging-operator \
  --namespace logging-system \
  -f <(yq m <(cat << EOF
monitoring:
  serviceMonitor:
    enabled: true
EOF
) <(helm get values logging-operator --namespace logging-system))
```

### Status

```sh
kubectl rollout status deploy/logging-operator \
  -n logging-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=logging-operator' \
  -n logging-system \
  -f
```

### Issues

<!-- ####

```log
Normal   NotTriggerScaleUp  64s (x31 over 6m6s)     cluster-autoscaler  pod didn't trigger scale-up (it wouldn't fit if a new node is added): 2 node(s) didn't match node selector
Warning  FailedScheduling   15s (x7 over 4m17s)     default-scheduler   0/30 nodes are available: 1 Insufficient cpu, 1 node(s) had taint {node-role.kubernetes.io/master: }, that the pod didn't tolerate, 28 node(s) didn't match Pod's node affinity.
```

TODO -->

#### Connection Refused (normally: Pattern not Matched)

```log
logging-operator-logging-fluentbit-q9rzn fluent-bit [2021/10/13 11:55:00] [error] [net] TCP connection failed: logging-operator-logging-fluentd.logging-system.svc:24240 (Connection refused)
logging-operator-logging-fluentbit-q9rzn fluent-bit [2021/10/13 11:55:00] [error] [net] socket #64 could not connect to logging-operator-logging-fluentd.logging-system.svc:24240
logging-operator-logging-fluentbit-q9rzn fluent-bit [2021/10/13 11:55:00] [error] [output:forward:forward.0] no upstream connections available
logging-operator-logging-fluentbit-q9rzn fluent-bit [2021/10/13 11:55:00] [ warn] [engine] failed to flush chunk '1-1634126099.495132870.flb', retry in 10 seconds: task_id=10, input=tail.0 > output=forward.0 (out_id=0)
```

```sh
#
kubectl exec logging-operator-logging-fluentd-0 \
  -c fluentd \
  -n logging-system \
    -- netstat -antp

#
kubectl exec logging-operator-logging-fluentd-0 \
  -n logging-system -- \
  tail -f -n +1 /fluentd/log/out
```

#### Pattern not Matched

```log
2021-10-13 13:08:35 +0000 [warn]: #0 send an error event to @ERROR: error_class=Fluent::Plugin::Parser::ParserError error="pattern not matched with data '{ \"time\": \"2021-10-13T13:07:54+00:00\", \"remote_addr\": \"-\", \"x-forward-for\": \"208.115.199.20\", \"request_id\": \"127e2a02cdf46c4fd24312a169b77e5a\", \"remote_user\": \"-\", \"bytes_sent\": 277, \"request_time\": 0.011, \"status\": 200, \"vhost\": \"[hostname]\", \"request_proto\": \"HTTP/1.1\", \"path\": \"/api/v1/system/status\", \"request_query\": \"-\", \"request_length\": 472, \"duration\": 0.011, \"method\": \"HEAD\", \"http_referrer\": \"https://[hostname]/api/v1/system/status\", \"http_user_agent\": \"Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)\" }\n'" location=nil tag="ingress-nginx.ingress-nginx-controller-f76cfd847-6xw58.controller" time=2021-10-13 13:07:54.836198647 +0000
```

TODO

#### Failed to Write

```log
2021-10-13 19:19:11 +0000 [warn]: #0 [clusterflow:logging-system:loki-flow:clusteroutput:logging-system:loki-output] failed to write post to http://loki-headless:3100/loki/api/v1/push (400 Bad Request entry for stream '{app_kubernetes_io_component="rabbitmq", app_kubernetes_io_name="rabbitmq", app_kubernetes_io_part_of="rabbitmq", container="rabbitmq", container_id="8fb156f627216e285a1bc5d4843411254a7b601b7aefca4fa3df028bc0f601b0", controller_revision_hash="rabbitmq-server-7f6f8c6fb", host="ip-10-98-71-49.ec2.internal", namespace="dev-rgusse-9317-2", pod="rabbitmq-server-2", pod_id="055e2a09-6558-40c3-8c70-c091dc8c25b6", statefulset_kubernetes_io_pod_name="rabbitmq-server-2"}' has timestamp too old: 2021-10-05 16:04:54.076579774 +0000 UTC
```

TODO

### Delete

```sh
helm uninstall logging-operator \
  -n logging-system

kubectl delete ns logging-system \
  --grace-period=0 \
  --force
```
