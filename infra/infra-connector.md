# Infra Connector

## Helm

### Dependencies

- [Infra](./README.md#helm)

### Install

```sh
#
kubectl create ns infra-connector

#
export SONARQUBE_HELM_CHART_VERSION='0.20.9'

export INFRA_CONNECTOR_SERVER='infra-server.infra-system.svc'
export INFRA_CONNECTOR_NAME='minikube'
export INFRA_CONNECTOR_ACCESS_KEY='DzYkGTTH4I.0WsIJcgOAwn59mwdqzutgIDd'

#
helm upgrade infra-connector infrahq/infra \
  -n infra-connector \
  --version "$SONARQUBE_HELM_CHART_VERSION" \
  -f <(cat << EOF
connector:
  service:
    type: ClusterIP

  config:
    server: ${INFRA_CONNECTOR_SERVER}
    name: ${INFRA_CONNECTOR_NAME}
    accessKey: ${INFRA_CONNECTOR_ACCESS_KEY}
    skipTLSVerify: true

  env:
    - name: INFRA_LOG_LEVEL
      value: info
EOF
)

#
kubectl get all -n infra-connector
```

<!--
#
kubectl port-forward \
  --address 0.0.0.0 \
  -n infra-system \
  svc/infra-server \
  8080:80
-->

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=infra-connector,app.kubernetes.io/name=infra-connector' \
  -n infra-connector \
  -f
```
