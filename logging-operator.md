# Logging Operator

## Links

- [Code Repository](https://github.com/banzaicloud/logging-operator)
- [Main Website](https://banzaicloud.com/products/logging-operator/)

## Guides

- [Quickstarts](https://github.com/banzaicloud/logging-operator-docs/tree/master/docs/quickstarts)

## Helm

### References

- [Configuration](https://github.com/banzaicloud/logging-operator/tree/master/charts/logging-operator#configuration)

### Repository

```sh
helm repo add banzaicloud-stable 'https://kubernetes-charts.banzaicloud.com'
helm repo update
```

### Dependencies

- Assuming there is already a `logging` namespace.

### Install

```sh
helm install logging-operator banzaicloud-stable/logging-operator \
  --namespace logging \
  --version 3.13.0
```

<!--
- [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

monitoring:
  serviceMonitor:
    enabled: true
-->

### Status

```sh
kubectl rollout status deploy/logging-operator \
  -n logging
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=logging-operator' \
  -n logging \
  -f
```

### Delete

```sh
helm uninstall logging-operator \
  -n logging
```

## Implementations

### Dependencies

#### Logging Generator (Demo)

##### References

- [Configuration](https://github.com/banzaicloud/logging-operator/tree/master/charts/logging-demo#configuration)

##### Install

```sh
helm install logging-demo banzaicloud-stable/logging-demo \
  --namespace logging \
  --version 3.13.0 \
  -f <(cat << EOF
loggingOperator:
  tls:
    enabled: false
EOF
)
```

<!--
loggingOperator:
  fluentd:
    metrics:
      serviceMonitor: true
  fluentbit:
    metrics:
      serviceMonitor: true
-->

##### Status

```sh
kubectl rollout status deploy/logging-demo-log-generator \
  -n logging
```

##### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=log-generator' \
  -n logging \
  -f
```

##### Delete

```sh
helm uninstall logging-demo \
  -n logging
```

### Running

#### S3

**Dependencies:** Create [MinIO](/minio/README.md#helm) in the `logging` namespace.

```sh
#
cat << EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Logging
metadata:
  name: default-logging-simple
spec:
  # fluentd:
  #   metrics:
  #     serviceMonitor: true
  # fluentbit:
  #   metrics:
  #     serviceMonitor: true
  controlNamespace: logging
EOF

#
cat << EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Output
metadata:
  name: demo-output
spec:
  s3:
    aws_key_id:
      valueFrom:
        secretKeyRef:
          key: access-key
          name: minio
    aws_sec_key:
      valueFrom:
        secretKeyRef:
          key: secret-key
          name: minio
    buffer:
      timekey: 10s
      timekey_use_utc: true
      timekey_wait: 0s
    force_path_style: 'true'
    path: logs/${tag}/%Y/%m/%d/
    s3_bucket: demo
    s3_endpoint: http://minio.logging.svc.cluster.local:9000
    s3_region: test_region
EOF

#
cat << EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Flow
metadata:
  name: demo-flow
spec:
  filters:
  - tag_normaliser: {}
  - parser:
      remove_key_name_field: true
      reserve_data: true
      parse:
        type: nginx
        # type: json
  match:
  - select:
      labels:
        app.kubernetes.io/instance: logging-demo
        app.kubernetes.io/name: log-generator
  localOutputRefs:
  - demo-output
EOF
```

#### Elasticsearch

<!-- ```sh
#
cat << EOF | kubectl -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: ClusterOutput
metadata:
  name: logging-output
spec:
  elasticsearch:
    host: logging-es-http
    port: 9200
    scheme: https
    ssl_verify: false
    ssl_version: TLSv1_2
    user: elastic
    password:
      valueFrom:
        secretKeyRef:
          name: logging-es-elastic-user
          key: elastic
    buffer:
      timekey: 1m
      timekey_wait: 30s
      timekey_use_utc: true
EOF
``` -->

TODO

#### Loki

<!-- apiVersion: logging.banzaicloud.io/v1beta1
kind: ClusterOutput
metadata:
  name: loki-master
spec:
  loki:
    url: https://loki.ops.prod-rcplatform.internal
    insecure_tls: true
    # tenant: "1"
    extra_labels:
      cluster: sanity-a -->

<!-- apiVersion: logging.banzaicloud.io/v1beta1
kind: ClusterFlow
metadata:
  name: cluster-flow
spec:
  globalOutputRefs:
    - loki-master
  filters:
    - parser:
        remove_key_name_field: true
        reserve_data: true
        parse:
          type: nginx
    - tag_normaliser: {}
        # format: ${namespace_name}.${pod_name}.${container_name}
  match:
    - select:
        namespaces:
          - monitoring
          - logging
          - kube-system
          - argo-system
          - external-dns
          - ingress-nginx
          - cert-manager
          - security
    # - exclude:
    #     namespaces:
    #       - default -->

TODO

#### Kafka

TODO

#### AWS Cloudwatch

TODO

#### LogDNA

TODO
