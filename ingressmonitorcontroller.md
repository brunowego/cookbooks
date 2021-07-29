# Ingress Monitor Controller

## Links

- [Code Repository](https://github.com/stakater/IngressMonitorController)

## Helm

### References

- [Values](https://github.com/stakater/IngressMonitorController/tree/master/charts/ingressmonitorcontroller#chart-values)

### Repository

```sh
helm repo add stakater 'https://stakater.github.io/stakater-charts'
helm repo update
```

### Install

```sh
#
kubectl apply \
  -f 'https://raw.githubusercontent.com/stakater/IngressMonitorController/master/charts/ingressmonitorcontroller/crds/endpointmonitor.stakater.com_endpointmonitors.yaml'

#
export UPTIMEROBOT_CONFIG="$(cat << EOS | base64 -w 0
providers:
- name: UptimeRobot
  apiKey: [api-key]
  apiURL: https://api.uptimerobot.com/v2/
  alertContacts: "[alert-contacts]"
enableMonitorDeletion: true
EOS
)"

#
cat << EOF | kubectl apply \
  -n kube-system \
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
helm install ingressmonitorcontroller stakater/ingressmonitorcontroller \
  --namespace kube-system \
  --version 2.1.9
```

### Status

```sh
kubectl rollout status deploy/ingressmonitorcontroller \
  -n kube-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=ingressmonitorcontroller' \
  -c kube-rbac-proxy \
  -n kube-system \
  -f

kubectl logs \
  -l 'app.kubernetes.io/name=ingressmonitorcontroller' \
  -c manager \
  -n kube-system \
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
  url: https://app.example.com
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
  -n kube-system
```
