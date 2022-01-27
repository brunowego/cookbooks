# Elasticsearch

<!--
https://app.pluralsight.com/library/courses/executing-complex-queries-elasticsearch/table-of-contents

https://linkedin.com/learning/learning-the-elastic-stack-2/start-listening-to-your-infrastructure
-->

## Alternatives

- [OpenSearch](https://github.com/opensearch-project/OpenSearch)
- [Typesense](https://github.com/typesense/typesense)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h elasticsearch \
  -e discovery.type=single-node \
  -v elasticsearch-config:/usr/share/elasticsearch/config \
  -v elasticsearch-data:/usr/share/elasticsearch/data \
  -v elasticsearch-logs:/usr/share/elasticsearch/logs \
  -p 9200:9200 \
  -p 9300:9300 \
  --name elasticsearch \
  --network workbench \
  docker.io/library/elasticsearch:7.5.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9200'
```

### Remove

```sh
docker rm -f elasticsearch
docker volume rm elasticsearch-config elasticsearch-data elasticsearch-logs
```

## Helm

### References

- [Configuration](https://github.com/elastic/helm-charts/tree/master/elasticsearch#configuration)

### Repository

```sh
helm repo add elastic 'https://helm.elastic.co'
helm repo update
```

### Install

```sh
#
kubectl create ns elastic

#
export KUBERNETES_IP='127.0.0.1'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install elasticsearch elastic/elasticsearch \
  --namespace elastic \
  --version 7.14.0 \
  -f <(cat << EOF
replicas: 1

minimumMasterNodes: 1

ingress:
  enabled: true
  hosts:
  - host: elasticsearch.${DOMAIN}
    paths:
    - path: /
EOF
)
```

> Wait! This process take a while.

### Status

```sh
kubectl rollout status statefulset/elasticsearch-master \
  -n elastic
```

### Logs

```sh
kubectl logs \
  -l 'release=elasticsearch' \
  -n elastic \
  -f
```

### Issues

#### Missing Discovery Type

```log
Exception in thread "main" java.nio.file.NoSuchFileException: /usr/share/elasticsearch/config/jvm.options
```

Set environment variable `discovery.type` with value `single-node`.

#### Disk Usage Exceeded

```log
Internal Server Error","message":"Unexpected bulk response [429] cluster_block_exception: index [.kibana_7.14.0_001] blocked by: [TOO_MANY_REQUESTS/12/disk usage exceeded flood-stage watermark, index has read-only-allow-delete block];
```

```sh
#
curl \
  -X PUT \
  -H 'Content-Type: application/json' \
  -d '{"index.blocks.read_only_allow_delete": null}' \
  "http://elasticsearch.${DOMAIN}/_all/_settings"

#
curl \
  -X PUT \
  -H 'Content-Type: application/json' \
  -d '{"transient":{"cluster.routing.allocation.disk.watermark.low":"50gb","cluster.routing.allocation.disk.watermark.high":"20gb","cluster.routing.allocation.disk.watermark.flood_stage":"10gb","cluster.info.update.interval":"1m"}}' \
  "http://elasticsearch.${DOMAIN}/_cluster/settings?pretty" \

#
curl \
  -X PUT \
  -H 'Content-Type: application/json' \
  -d '{"index.blocks.read_only_allow_delete": null}' \
  "http://elasticsearch.${DOMAIN}/_all/_settings"
```

#### 429 Too Many Requests

```log
Unable to update UI setting
Request failed with status code: 429
```

```sh
curl \
  -X PUT \
  -H 'Content-Type: application/json' \
  -d '{"index.blocks.read_only_allow_delete": null}' \
  "http://elasticsearch.${DOMAIN}/_all/_settings"
```

### Delete

```sh
helm uninstall elasticsearch \
  -n elastic

kubectl delete ns elastic \
  --grace-period=0 \
  --force
```
