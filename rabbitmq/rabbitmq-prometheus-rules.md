# RabbitMQ Prometheus Rules

## Links

- [Code Repository](https://github.com/rabbitmq/cluster-operator/tree/main/observability/prometheus/rules/rabbitmq)

## Rules

```sh
#
export KUBECTL_NAMESPACE='my-app'

#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.ruleSelector.matchLabels}' \
  -n monitoring

#
kubectl get prometheusrule -A

#
cat << \EOF | kubectl apply \
  -n "$KUBECTL_NAMESPACE" \
  -f -
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: rabbitmq.rules
  labels:
    app: kube-prometheus-stack
    release: prometheus
spec:
  groups:
  - name: rabbitmq.rules
    rules:
    - alert: RabbitmqTooManyMessagesInQueue
      expr: sum(rabbitmq_queue_messages_ready) by (queue) > 100
      for: 1m
      labels:
        namespace: my-app
        severity: warning
        job: rabbitmq
      annotations:
        summary: More than 100 ready messages in queue {{ $labels.queue }}.
        description: More than 100 ready messages in queue {{ $labels.queue }}.
    - alert: RabbitmqTooManyConnections
      expr: rabbitmq_connections > 100
      for: 1m
      labels:
        namespace: my-app
        severity: warning
        job: rabbitmq
      annotations:
        summary: Too many connections (instance {{ $labels.instance }}).
        description: Too many connections (instance {{ $labels.instance }}).
    - alert: RabbitmqNoConsumer
      expr: sum(rabbitmq_queue_consumers) by (queue) == 0
      for: 1m
      labels:
        namespace: my-app
        severity: warning
        job: rabbitmq
      annotations:
        summary: No consumer for queue {{ $labels.queue }}.
        description: No consumer for queue {{ $labels.queue }}.
    - alert: RabbitmqClusterNodeDown
      expr: sum(rabbitmq_identity_info) by (rabbitmq_cluster) < 2
      for: 1m
      labels:
        namespace: my-app
        severity: critical
        job: rabbitmq
      annotations:
        summary: Less than 3 nodes running in RabbitMQ cluster.
        description: Less than 3 nodes running in RabbitMQ cluster.
    - alert: RabbitmqMemoryUsage
      expr: (rabbitmq_resident_memory_limit_bytes - rabbitmq_process_resident_memory_bytes ) / 1024 / 1024 < 500
      for: 2m
      labels:
        namespace: my-app
        severity: warning
        job: rabbitmq
      annotations:
        summary: Memory available is less than 500MB!
        description: Memory available is less than 500MB!
    - alert: RabbitmqHighMemoryUsage
      expr: rabbitmq_process_resident_memory_bytes / rabbitmq_resident_memory_limit_bytes * 100 > 90
      for: 2m
      labels:
        namespace: my-app
        severity: warning
        job: rabbitmq
      annotations:
        summary: A node (instance {{ $labels.instance }}) is using more than 90% of allocated RAM.
        description: A node (instance {{ $labels.instance }}) is using more than 90% of allocated RAM.
    - alert: RabbitmqFileDescriptorsUsage
      expr: rabbitmq_process_open_fds / rabbitmq_process_max_fds * 100 > 90
      for: 2m
      labels:
        namespace: my-app
        severity: warning
        job: rabbitmq
      annotations:
        summary: A node (instance {{ $labels.instance }}) is using more than 90% of file descriptors.
        description: A node (instance {{ $labels.instance }}) is using more than 90% of file descriptors.
    - alert: RabbitmqNodeNotDistributed
      expr: erlang_vm_dist_node_state < 3
      for: 0m
      labels:
        namespace: my-app
        severity: critical
        job: rabbitmq
      annotations:
        summary: Rabbitmq node not distributed (instance {{ $labels.instance }}).
        description: Rabbitmq node not distributed (instance {{ $labels.instance }}).
EOF
```

<!--
- alert: RabbitmqDeadLetterQueueFillingUp
  expr: rabbitmq_queue_messages{queue="my-dead-letter-queue"} > 10
  for: 1m
  labels:
    severity: warning
  annotations:
    summary: "Rabbitmq dead letter queue filling up (instance {{ $labels.instance }})"
    description: "Dead letter queue is filling up (> 10 msgs)\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
-->

> Wait! This process take a while.

```sh
echo -e "[INFO]\thttp://prometheus.${INGRESS_HOST}.nip.io/rules#rabbitmq.rules"
```
