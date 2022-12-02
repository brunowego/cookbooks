# New Relic

<!--
https://www.youtube.com/watch?v=OOc8iN9dWfw

https://www.udemy.com/course/the-complete-introduction-to-new-relic-one/
https://www.udemy.com/course/new-relic-apm-application-performance-management-for-devops/
https://www.udemy.com/course/learn-new-relic-monitoring-and-devops-for-the-cloud-aws/
-->

## Links

- [Org. Repository](https://github.com/newrelic)
- [Main Website](https://newrelic.com/)

## Console

- [New Relic Explorer](https://one.newrelic.com/launcher/)

## Docs

- [New Relic University](https://learn.newrelic.com/)
- [Get started with the New Relic CLI](https://developer.newrelic.com/automate-workflows/get-started-new-relic-cli/)

## Solutions

- Application Performance Monitoring (APM)
- Browser
- Infrastructure
- Insights
- Mobile
- New Relic Logs
- New Relic Serverless for AWS Lambda
- New Relic Traces
- Synthetics

## Glossary

- Extended Berkeley Packet Filter (eBPF)

## Helm

### References

- [Values](https://github.com/newrelic/helm-charts/tree/master/charts/nri-bundle#values)

### Repository

```sh
helm repo add newrelic 'https://helm-charts.newrelic.com'
helm repo update
```

### Install

```sh
#
kubectl create ns newrelic-system
# kubectl create ns monitor

#
helm search repo -l newrelic/nri-bundle

#
export NEWRELIC_CLUSTER_NAME='<cluster-name>'
export NEWRELIC_LICENSE_KEY='<license-key>'

#
helm upgrade newrelic-bundle newrelic/nri-bundle \
  --namespace newrelic-system \
  --version 5.0.2 \
  -f <(cat << EOF
global:
  cluster: $NEWRELIC_CLUSTER_NAME
  licenseKey: $NEWRELIC_LICENSE_KEY
kube-state-metrics:
  enabled: true
newrelic-logging:
  enabled: true
nri-kube-events:
  enabled: true
nri-metadata-injection:
  enabled: true
nri-prometheus:
  enabled: true
EOF
)

#
kubectl get all -n newrelic-system
```

### Status

```sh
kubectl rollout status statefulset/newrelic-bundle-newrelic-prometheus-agent \
  -n newrelic-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=metrics,app.kubernetes.io/instance=newrelic-bundle' \
  -n newrelic-system \
  -f
```

### Delete

```sh
helm uninstall newrelic \
  -n newrelic-system

kubectl delete ns newrelic-system \
  --grace-period=0 \
  --force
```

## CLI

### Installation

#### Homebrew

```sh
brew install newrelic-cli
```

### Commands

```sh
newrelic -h
newrelic apm -h
```

### Configuration

```sh
#
newrelic profiles add \
  --profile '[name]' \
  --apiKey '[api-key]' \
  -r 'us'

#
newrelic profiles list

#
newrelic profiles default \
  --profile '[name]'
```

<!--
newrelic profile configure \
  --profile '[name]'
-->

### Usage

```sh
#
newrelic apm application search \
  --name '[app-name]' | \
    jq '.[].name'

#
newrelic entity search \
  --name 'test'

#
newrelic entity tags create \
  --guid 'GUID' \
  --tag '<key>:<value>'

#
newrelic entity tags get \
  --guid 'GUID'
```

### Tips

#### APM Single Delete

```sh
#
export NEWRELIC_API_KEY='[api-key]'
export NEWRELIC_APP_ID=''

curl \
  -X DELETE \
  "https://api.newrelic.com/v2/applications/${NEWRELIC_APP_ID}.json" \
  -H "X-Api-Key:${NEWRELIC_API_KEY}" \
  -i
```

#### APM Multiple Deletion

```sh
#
export NEWRELIC_API_KEY='[api-key]'
export NEWRELIC_APM_APP_NAME=''

#
newrelic apm application search \
  --name "$NEWRELIC_APM_APP_NAME" | \
    jq '.[].name'

#
newrelic apm application search \
  --name "$NEWRELIC_APM_APP_NAME" | \
    jq '.[].applicationId' | \
      xargs -I '{}' curl \
        -X DELETE \
        'https://api.newrelic.com/v2/applications/{}.json' \
        -H "X-Api-Key:${NEWRELIC_API_KEY}" \
        -i
```

<!-- ####

1. Alerts & AI
2. Policies

Notification Channels -->
