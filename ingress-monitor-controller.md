# Ingress Monitor Controller

**Keywords:** Kubernetes Status Page

## Links

- [Code Repository](https://github.com/stakater/IngressMonitorController)
- [Supported Uptime Checkers](https://github.com/stakater/IngressMonitorController#supported-uptime-checkers)

## Supported Uptime Checkers

- [Google Cloud Uptime Checks]()
- [Microsoft Application Insights]()
- [Pingdom](https://pingdom.com)
- [StatusCake](https://statuscake.com)
- [Updown](https://updown.io)
- [Uptime](https://uptime.com)
- [UptimeRobot](/uptimerobot/README.md)

## Helm

### References

- [Values](https://github.com/stakater/IngressMonitorController/tree/master/charts/ingressmonitorcontroller#chart-values)

### Repository

```sh
helm repo add stakater 'https://stakater.github.io/stakater-charts'
helm repo update
```

### Dependencies

1. UptimeRobot -> [My Settings](https://uptimerobot.com/dashboard#mySettings)
2. API Settings -> Copy "Main API Key"

### Install

<!--
export UPTIMEROBOT_EMAIL='<email>'
select(.friendly_name == '"${UPTIMEROBOT_EMAIL}"')
-->

```sh
#
kubectl create ns uptime-system
# kubectl create ns monitor

#
export UPTIMEROBOT_API_KEY='<main-api-key>'
export UPTIMEROBOT_ALERT_CONTACTS="$(curl -sX POST -H 'Cache-Control: no-cache' -H 'Content-Type: application/x-www-form-urlencoded' -d 'api_key='"${UPTIMEROBOT_API_KEY}"'&format=json' 'https://api.uptimerobot.com/v2/getAlertContacts' | jq -r '.alert_contacts[] | .id')"
export UPTIMEROBOT_CONFIG="$(cat << EOS | base64 -w 0
providers:
- name: UptimeRobot
  apiKey: $UPTIMEROBOT_API_KEY
  apiURL: https://api.uptimerobot.com/v2
  alertContacts: $UPTIMEROBOT_ALERT_CONTACTS
enableMonitorDeletion: true
EOS
)"

#
cat << EOF | kubectl apply \
  -n uptime-system \
  -f -
kind: Secret
apiVersion: v1
type: Opaque
metadata:
  name: imc-config
data:
  config.yaml: >-
    $UPTIMEROBOT_CONFIG
EOF

#
helm search repo -l stakater/ingressmonitorcontroller

#
helm install ingressmonitorcontroller stakater/ingressmonitorcontroller \
  --namespace uptime-system \
  --version 2.1.21

#
kubectl get all -n uptime-system
```

### Status

```sh
kubectl rollout status deployment/ingressmonitorcontroller \
  -n uptime-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=ingressmonitorcontroller' \
  -c kube-rbac-proxy \
  -n uptime-system \
  -f

kubectl logs \
  -l 'app.kubernetes.io/name=ingressmonitorcontroller' \
  -c manager \
  -n uptime-system \
  -f
```

<!-- ### Endpoint Monitor

#### UptimeRobot

```sh
cat << EOF | kubectl apply \
  -f -
apiVersion: endpointmonitor.stakater.com/v1alpha1
kind: EndpointMonitor
metadata:
  name: app
spec:
  forceHttps: true
  url: https://app.domain.tld
  uptimeRobotConfig:
    interval: 60
    alertContacts: "[alert-contact]"
    monitorType: https
    keywordValue: "200"
EOF
``` -->

### Delete

```sh
helm uninstall ingressmonitorcontroller \
  -n uptime-system

kubectl delete ns uptime-system \
  --grace-period=0 \
  --force
```
