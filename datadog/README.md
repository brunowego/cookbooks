# Datadog

## Links

- [Main Website](https://datadoghq.com)
- [Dashboard](https://app.datadoghq.com)
  - [Application Keys](https://app.datadoghq.com/personal-settings/application-keys)
- [Docs](https://docs.datadoghq.com)
  - [OpenTelemetry in Datadog](https://docs.datadoghq.com/opentelemetry/)

<!--
https://artifacthub.io/packages/helm/datadog/datadog-operator
https://artifacthub.io/packages/helm/datadog/datadog-crds
-->

## Helm

### References

- [Values](https://github.com/DataDog/helm-charts/tree/main/charts/datadog#values)

### Repository

```sh
helm repo add datadog https://helm.datadoghq.com
helm repo update
```

### Install

```sh
#
kubectl create ns datadog
# kubectl create ns observability

#
kubens datadog

#
helm search repo -l datadog/datadog

# Kubernetes Monitoring Key
export DATADOG_API_KEY='<api-key>'

#
helm install datadog datadog/datadog \
  --version 3.28.1 \
  -f <(cat << EOF
datadog:
  apiKey: $DATADOG_API_KEY
EOF
)
```

### Status

```sh
kubectl rollout status deploy/datadog-cluster-agent
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=cluster-agent' \
  -f
```

### Delete

```sh
helm uninstall datadog

kubectl delete ns datadog \
  --grace-period=0 \
  --force
```
