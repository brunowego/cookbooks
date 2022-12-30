# Loki

<!--
https://medium.com/nerd-for-tech/logging-at-scale-in-kubernetes-using-grafana-loki-3bb2eb0c0872
-->

## Links

- [Code Repository](https://github.com/grafana/loki)
- [Main Website](https://grafana.com/oss/loki/)

## Videos

- [Observability with Loki 2.0](https://grafana.com/go/webinar/observability-with-loki-2.0/)

## Helm

### References

- [Helm Repository](https://github.com/grafana/loki/tree/main/production/helm/loki)

### Repository

```sh
helm repo add grafana 'https://grafana.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns logging-system
# kubectl create ns logging

#
helm search repo -l grafana/loki

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm upgrade loki grafana/loki \
  --namespace logging-system \
  --version 3.8.0 \
  -f <(cat << EOF
write:
  replicas: 1

read:
  replicas: 1

ingress:
  enabled: true
  ingressClassName: nginx
  hosts:
  - loki.${DOMAIN}
EOF
)
```

<!-- ### Configuration

```sh
#
helm upgrade loki grafana/loki \
  --namespace logging-system \
  -f <(yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' <(helm get values loki -o yaml --namespace logging-system) <(cat << EOF
config:
  auth_enabled: false

  ingester:
    chunk_idle_period: 3m
    chunk_block_size: 262144
    chunk_retain_period: 1m
    chunk_encoding: snappy
    chunk_target_size: 1536000
    max_transfer_retries: 0
    lifecycler:
      ring:
        kvstore:
          store: inmemory
        replication_factor: 1

  limits_config:
    enforce_metric_name: false
    reject_old_samples: true
    reject_old_samples_max_age: 168h
    ingestion_rate_mb: 15
    ingestion_burst_size_mb: 30
    max_chunks_per_query: 2000000
    max_label_name_length: 1024
    max_label_value_length: 2048
    max_streams_per_user: 10000
    max_entries_limit_per_query: 5000

  schema_config:
    configs:
    - from: 2020-10-24
      store: boltdb-shipper
      object_store: filesystem
      schema: v11
      index:
        prefix: index_
        period: 24h

  server:
    http_listen_port: 3100
    log_level: debug
    grpc_server_max_recv_msg_size: 8388608
    grpc_server_max_send_msg_size: 8388608

  storage_config:
    boltdb_shipper:
      active_index_directory: /data/loki/boltdb-shipper-active
      cache_location: /data/loki/boltdb-shipper-cache
      cache_ttl: 24h
      shared_store: filesystem
    filesystem:
      directory: /data/loki/chunks

  chunk_store_config:
    max_look_back_period: 0s

  table_manager:
    retention_deletes_enabled: true
    retention_period: 72h

  compactor:
    working_directory: /data/loki/boltdb-shipper-compactor
    shared_store: filesystem
EOF
))
``` -->

### Status

```sh
kubectl rollout status statefulset/loki-write \
  -n logging-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=write,app.kubernetes.io/instance=loki' \
  -n logging-system \
  -f
```

<!-- ### Validation

```sh
#
kubectl run -it --rm \
  logcli \
  --image docker.io/grafana/logcli:main-0f139e2-arm64 \
  --env LOKI_ADDR='http://loki-headless.logging-system:3100' \
  --restart 'Never' \
  -- labels
``` -->

<!-- ### Graph

**Dependencies:** [kubectl-graph](/kubectl/commands/graph.md), [Cypher Shell](/cypher-shell.md), [Neo4j](/neo4j.md#docker)

```sh
kubectl graph all \
  -n logging-system \
  -o cypher | \
    cypher-shell \
      -u neo4j \
      -p 'Pa$$w0rd!'
``` -->

### Delete

```sh
helm uninstall loki \
  -n logging-system

kubectl delete pvc \
  -l 'app=loki,release=loki' \
  -n logging-system
```

## CLI

### Installation

#### Homebrew

```sh
brew install loki
```

### Commands

```sh
loki -h
```

### Configuration

```sh
#
cat << EOF > ./config.yaml
auth_enabled: false
EOF
```

### Usage

```sh
#
export LOKI_ADDR="http://loki.${DOMAIN}"

#
loki labels
```

<!-- ### Issues

#### TBD

```log
failed parsing config: config.yaml,config/config.yaml does not exist, set config.file for custom config path
```

TODO

```sh
#
loki -version
``` -->
