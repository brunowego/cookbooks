# Apache Airflow

<!--
https://app.pluralsight.com/library/courses/productionalizing-data-pipelines-apache-airflow/table-of-contents
-->

## Alternatives

- [Argo Workflows](/argo/argo-workflows.md)

## Helm

### References

- [Helm Repository](https://github.com/airflow-helm/charts/tree/main/charts/airflow)

### Repository

```sh
helm repo add airflow-stable 'https://airflow-helm.github.io/charts'
helm repo update
```

### Dependencies

- [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

### Install

```sh
#
kubectl create namespace airflow

#
export INGRESS_HOST='127.0.0.1'

#
helm upgrade airflow airflow-stable/airflow \
  --namespace airflow \
  --version 8.4.1 \
  -f <(cat << EOF
airflow:
  users:
  - username: admin
    password: admin
    role: Admin
    email: admin@example.com
    firstName: admin
    lastName: admin

ingress:
  enabled: true
  web:
    host: airflow.${INGRESS_HOST}.nip.io
  flower:
    host: flower.${INGRESS_HOST}.nip.io

serviceMonitor:
  enabled: true
  selector:
    release: prometheus-stack

prometheusRule:
  enabled: true
EOF
)
```

### Status

```sh
kubectl rollout status deploy/airflow-web \
  -n airflow
```

### Logs

```sh
kubectl logs \
  -l 'release=airflow' \
  --max-log-requests 8 \
  -n airflow \
  -f
```

### Delete

```sh
helm uninstall airflow \
  -n airflow

kubectl delete namespace airflow \
  --grace-period=0 \
  --force
```
