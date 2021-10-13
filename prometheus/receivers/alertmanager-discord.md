# Alertmanager Discord

<!--
https://github.com/muqtadir/prometheus-values/blob/main/prometheus-operator/plat-alertmanager-config.yml
-->

## Links

- [Code Repository](https://github.com/viossat/alertmanager-discord)

## Docker

### Dependencies

- [Prometheus](/prometheus/README.md)
- [Alertmanager](/prometheus/prometheus-alertmanager.md)
- [MailHog](/mailhog.md)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h alertmanager-discord \
  -e WEBHOOK='https://discord.com/api/webhooks/[...]/[...]' \
  -p 9094:9094 \
  --name alertmanager-discord \
  --network workbench \
  docker.io/viossat/alertmanager-discord:latest
```

```sh
#
docker exec -i alertmanager /bin/sh << EOSHELL
cat << EOF > /etc/alertmanager/alertmanager.yml
global:
  smtp_smarthost: mailhog:1025
  smtp_from: Alertmanager <alertmanager@example.com>
  smtp_require_tls: false

templates:
- /etc/alertmanager/template/*.tmpl

route:
  group_by:
  - ...
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 4h
  receiver: default_receiver

  routes:
  - match:
      severity: critical
    continue: true

  - match:
      severity: critical
    receiver: discord_webhook

receivers:
- name: default_receiver
  email_configs:
  - to: admin@example.com
    send_resolved: true

- name: discord_webhook
  webhook_configs:
  - url: http://alertmanager-discord:9094
    send_resolved: true

EOF
EOSHELL

#
docker restart alertmanager
```

<!--
inhibit_rules:
- source_match:
    severity: 'critical'
  target_match:
    severity: 'warning'
  equal: ['app_type', 'category']

inhibit_rules:
- source_match:
    severity: 'critical'
  target_match:
    severity: 'warning'
  equal: ['alertname', 'dev', 'instance']
-->

### Remove

```sh
docker rm -f alertmanager-discord
```

## Custom Resource (CR)

### Install

```sh
#
cat << EOF | kubectl apply \
  -n monitoring \
  -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: alertmanager-discord
spec:
  selector:
    matchLabels:
      app: alertmanager-discord
  replicas: 1
  template:
    metadata:
      labels:
        app: alertmanager-discord
    spec:
      containers:
      - name: alertmanager-discord
        image: docker.io/benjojo/alertmanager-discord:latest
        imagePullPolicy: Always
        resources:
          limits:
            cpu: 20m
            memory: 40Mi
          requests:
            cpu: 20m
            memory: 40Mi
        ports:
        - containerPort: 9094
          name: http
        env:
        - name: DISCORD_WEBHOOK
          value: https://discord.com/api/webhooks/[id]/[token]
EOF

#
cat << EOF | kubectl apply \
  -n monitoring \
  -f -
apiVersion: v1
kind: Service
metadata:
  name: alertmanager-discord
spec:
  selector:
    app: alertmanager-discord
  ports:
  - name: http
    port: 9094
    targetPort: http
  type: ClusterIP
EOF
```

### Tips

#### Alertmanager Config Selector

```sh
#
kubectl get alertmanager \
  -o jsonpath='{.items[*].spec.alertmanagerConfigSelector}' \
  -n monitoring
```

#### Alertmanager Config Namespace Selector

```sh
#
kubectl get alertmanager \
  -o jsonpath='{.items[*].spec.alertmanagerConfigNamespaceSelector}' \
  -n monitoring

#
kubectl get namespace my-app \
  -o json |
    jq -r '.metadata.labels'

#
kubectl label namespace my-app alertmanagerconfig=enabled
```

#### Create Alertmanager Config

```sh
#
kubectl get alertmanagerconfig -A

#
cat << EOF | kubectl apply \
  -n my-app \
  -f -
apiVersion: monitoring.coreos.com/v1alpha1
kind: AlertmanagerConfig
metadata:
  name: discord
  labels:
    alertmanagerConfig: discord
spec:
  route:
    groupBy: ['job']
    groupWait: 30s
    groupInterval: 1m
    repeatInterval: 2m
    receiver: 'discord'
  receivers:
  - name: 'discord'
    webhookConfigs:
    - url: 'http://alertmanager-discord.monitoring:9094'
      sendResolved: true
EOF
```

> Wait! This process take a while.
