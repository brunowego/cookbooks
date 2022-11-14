# Elasticsearch, Fluentd and Kibana (EFK)

## Helm

### Install

```sh
#
mkdir -p ./efk

#
cat << EOF > ./efk/Chart.yml
apiVersion: v2
name: efk
description: A Helm chart which sets up the efk (fluentd, elasticsearch, kibana) Stack.
type: application
version: 0.1.0
appVersion: "1.0.0"

dependencies:
- name: fluentd
  version: 0.2.10
  repository: https://fluent.github.io/helm-charts
- name: elasticsearch
  version: 7.14.0
  repository: https://helm.elastic.co
- name: kibana
  version: 7.14.0
  repository: https://helm.elastic.co
EOF

#
helm dependency update ./efk

#
kubectl create ns efk

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install efk ./efk \
  --namespace efk \
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
    - host: elasticsearch.${DOMAIN}
      paths:
      - path: /

kibana:
  elasticsearchHosts: http://elasticsearch-master:9200

  ingress:
    enabled: true
    hosts:
    - host: kibana.${DOMAIN}
      paths:
      - path: /

fluentd:
  dashboards:
    enabled: false

  fileConfigs:
    02_filters.conf: |-
      <label @KUBERNETES>
        <match kubernetes.var.log.containers.fluentd**>
          @type relabel
          @label @FLUENT_LOG
        </match>
        # <match kubernetes.var.log.containers.**_kube-system_**>
        #   @type null
        #   @id ignore_kube_system_logs
        # </match>
        <filter kubernetes.**>
          @type kubernetes_metadata
          @id filter_kube_metadata
          skip_labels false
          skip_container_metadata false
          skip_namespace_metadata true
          skip_master_url true
        </filter>
        <filter kubernetes.var.log.containers.**>
          @type parser
          <parse>
            @type json
            json_parser json
          </parse>
          replace_invalid_sequence true
          emit_invalid_record_to_error false
          key_name log
          reserve_data true
        </filter>
        <match **>
          @type relabel
          @label @DISPATCH
        </match>
      </label>
EOF
)
```

### Status

```sh
kubectl rollout status deploy/efk-kibana \
  -n efk
```

### Logs

```sh
kubectl logs \
  -l 'app=kibana' \
  -n efk \
  -f
```

### Validation

```sh
#
curl "http://elasticsearch.${DOMAIN}/_cat/indices?v"

#
curl "http://elasticsearch.${DOMAIN}/_aliases?pretty=true"
```

### Dashboard

1. Home -> Analytics -> Dashboard
2. Create index pattern
   - Index pattern name: `fluentd*`
   - Next step
   - Time field: Select `@timestamp`
   - Create index pattern

### Delete

```sh
helm uninstall efk \
  -n efk

kubectl delete ns efk \
  --grace-period=0 \
  --force
```
