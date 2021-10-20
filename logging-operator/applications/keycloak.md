# Keycloak

## Apply

```sh
#
kubens [namespace]

#
kubectl get clusteroutput loki-output \
  -n logging-system

#
kubectl get pods -l 'app.kubernetes.io/name=keycloak,app.kubernetes.io/instance=keycloak'

#
cat << \EOF | kubectl apply \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Flow
metadata:
  name: keycloak-flow
spec:
  globalOutputRefs:
  - loki-output
  filters:
  - tag_normaliser:
      format: ${namespace_name}.${pod_name}.${container_name}
  - parser:
      remove_key_name_field: true
      reserve_data: true
      parse:
        type: multi_format
        patterns:
        - format: regexp
          expression: '/^(?<time>[^\]]*) \[(?<level>[^ ]*)\] (?<source>[^\":]*): (?<message>.*)$/'
          time_key: logtime
          time_format: '%Y-%m-%dT%H:%M:%S.%LZ'
        - format: regexp
          expression: '/^time="(?<time>[^\]]*)" level=(?<level>[^ ]*) msg="(?<message>[^\"]*)"/'
          time_key: time
          time_format: '%Y-%m-%dT%H:%M:%SZ'
        - format: regexp
          expression: '/^level=(?<level>[^ ]*) ts=(?<time>[^\]]*) caller=(?<source>.*) msg="(?<message>[^\"]*)"/'
          time_key: time
          time_format: '%Y-%m-%dT%H:%M:%S.%LZ'
  match:
  - select:
      labels:
        app.kubernetes.io/name: keycloak
        app.kubernetes.io/instance: keycloak
EOF

#
kubectl get flow
```
