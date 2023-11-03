# OpenCost

## Links

- [Code Repository](https://github.com/opencost/opencost)
- [Main Website](https://opencost.io)
- [Docs](https://opencost.io/docs)
  - [Kubectl cost queries](https://opencost.io/docs/kubectl-cost)

## Helm

### Dependencies

- [Prometheus](/prometheus/README.md#helm)

### References

- [Values](https://github.com/opencost/opencost-helm-chart/tree/main/charts/opencost#values)

### Repository

```sh
helm repo add opencost 'https://opencost.github.io/opencost-helm-chart'
helm repo update
```

### Install

```sh
#
kubectl create ns opencost
# kubectl create ns finops

#
kubens opencost

#
helm search repo -l opencost/opencost

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install opencost opencost/opencost \
  --version 1.14.3 \
  -f <(cat << EOF
opencost:
  prometheus:
    internal:
      enabled: true
      serviceName: prometheus-server
      namespaceName: prometheus
      port: 80

  ui:
    ingress:
      enabled: true
      ingressClassName: nginx
      # annotations:
      #   cert-manager.io/cluster-issuer: letsencrypt-issuer
      hosts:
        - host: opencost.${K8S_DOMAIN}
          paths: ['/']
      # tls:
      #   - secretName: opencost.tls-secret
      #     hosts:
      #       - opencost.${K8S_DOMAIN}
EOF
)
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/opencost \
  9090:9090
-->

### Status

```sh
kubectl rollout status deploy/opencost
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=opencost' \
  -f
```

### Delete

```sh
helm uninstall opencost

kubectl delete ns opencost \
  --grace-period=0 \
  --force
```

## CLI

### Dependencies

- [kubectl-cost](/kubectl/commands/cost.md)

```sh
#
kubectl cost version # >= 0.6.0
```

### Links

- [Docs](https://opencost.io/docs/kubectl-cost)

### Usage

```sh
#
kubectl cost namespace --service-name opencost --service-port 9003 -N opencost -A
```

<!--
cat << EOF | kubectl cost predict --service-name opencost --service-port 9003 -N opencost -f -
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: slim
spec:
  selector:
    matchLabels:
      app: slim
  template:
    metadata:
      labels:
        app: slim
    spec:
      containers:
        - name: app
          image: gcr.io/distroless/python3-debian11
          command:
            - python
            - -m
            - http.server
            - '8080'
EOF
-->

### Issues

#### Use Proxy

```log
Error: failed to query allocation API: failed to port forward query: received non-200 status code 404 and data: 404 page not found
```

```sh
#
kubectl proxy --port 8080

#
export KUBECTL_COST_USE_PROXY=true
```

#### TBD

```log
Error: failed to query allocation API: failed to proxy get kubecost. err: the server could not find the requested resource (get services opencost:9003); data: 404 page not found
```

TODO
