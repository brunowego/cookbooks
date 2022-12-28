# Flagger

<!--
https://www.udemy.com/course/canary-deployments-to-kubernetes-using-istio-and-friends/
https://github.com/chiku11/flagger-canary-manual
-->

## Links

- [Code Repository](https://github.com/fluxcd/flagger)
- [Main Website](https://flagger.app/)

## Guides

- [Monitoring](https://docs.flagger.app/usage/monitoring)

## Helm

### References

- [Helm Chart](https://github.com/fluxcd/flagger/tree/main/charts/flagger)

### Repository

```sh
helm repo add flagger 'https://flagger.app'
helm repo update
```

### Install

```sh
#
kubectl apply -f 'https://raw.githubusercontent.com/fluxcd/flagger/main/artifacts/flagger/crd.yaml'
```

#### NGINX Ingress Controller

**Dependencies:** [NGINX Ingress Controller](/nginx/ingress-controller/README.md#helm) and [Prometheus](/prometheus/README.md#helm)

```sh
#
helm install flagger flagger/flagger \
  --namespace ingress-nginx \
  --version 1.14.0 \
  -f <(cat << EOF
metricsServer: http://prometheus-server.monitoring-system

meshProvider: nginx
EOF
)
```

### Status

```sh
kubectl rollout status deploy/flagger \
  -n ingress-nginx
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=flagger' \
  -n ingress-nginx \
  -f
```

### Delete

```sh
helm uninstall flagger \
  -n ingress-nginx
```
