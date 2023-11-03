# Elasticsearch, Logstash and Kibana (ELK)

## Helm

### Install

```sh
#
mkdir -p ./elk

#
cat << EOF > ./elk/Chart.yml
apiVersion: v2
name: elk
description: A Helm chart which sets up the elk (logstash, elasticsearch, kibana) Stack.
type: application
version: 0.1.0
appVersion: "1.0.0"

dependencies:
- name: filebeat
  version: 7.14.0
  repository: https://helm.elastic.co
- name: logstash
  version: 7.14.0
  repository: https://helm.elastic.co
- name: elasticsearch
  version: 7.14.0
  repository: https://helm.elastic.co
- name: kibana
  version: 7.14.0
  repository: https://helm.elastic.co
EOF

#
helm dependency update ./elk

#
kubectl create ns elk

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install elk ./elk \
  --namespace elk \
  -f <(cat << EOF
elasticsearch:
  antiAffinity: 'soft'

  replicas: 1

  minimumMasterNodes: 1

  clusterHealthCheckParams: 'wait_for_status=yellow&timeout=1s'

  esJavaOpts: '-Xmx128m -Xms128m'

  # resources:
  #   requests:
  #     cpu: 300m
  #     memory: 1Gi
  #   limits:
  #     cpu: 300m
  #     memory: 1Gi

  volumeClaimTemplate:
    accessModes:
    - ReadWriteOnce
    resources:
      requests:
        storage: 100M

  ingress:
    enabled: true
    hosts:
    - host: elasticsearch.${K8S_DOMAIN}
      paths:
      - path: /

kibana:
  elasticsearchHosts: http://elasticsearch-master:9200

  ingress:
    enabled: true
    hosts:
    - host: kibana.${K8S_DOMAIN}
      paths:
      - path: /

logstash:
  persistence:
    enabled: true

  logstashConfig:
    logstash.yml: |
      http.host: 0.0.0.0
      xpack.monitoring.enabled: false

  logstashPipeline:
    uptime.conf: |
      input { exec { command => 'uptime' interval => 30 } }
      output { elasticsearch { hosts => ['http://elasticsearch-master:9200'] index => 'logstash' } }

filebeat:
  deployment:
    enabled: false

  daemonset:
    enabled: true

  filebeatConfig:
    filebeat.yml: |
      filebeat.inputs:
      - type: container
        paths:
        - /var/log/containers/*.log
        processors:
        - add_kubernetes_metadata:
            host: \${NODE_NAME}
            matchers:
            - logs_path:
                logs_path: '/var/log/containers/'
      output.logstash:
        hosts: ['elk-logstash-headless:9600']
EOF
)
```

### Status

```sh
kubectl rollout status deploy/elk-kibana \
  -n elk
```

### Logs

```sh
kubectl logs \
  -l 'app=kibana' \
  -n elk \
  -f
```

### Validation

```sh
#
curl "http://elasticsearch.${K8S_DOMAIN}/_cat/indices?v"

#
curl "http://elasticsearch.${K8S_DOMAIN}/_aliases?pretty=true"
```

### Dashboard

1. Home -> Analytics -> Dashboard
2. Create index pattern
   - Index pattern name: `logstash*`
   - Next step
   - Time field: Select `@timestamp`
   - Create index pattern

### Delete

```sh
helm uninstall elk \
  -n elk

kubectl delete ns elk \
  --grace-period=0 \
  --force
```
