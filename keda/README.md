# Kubernetes Event-driven Autoscaling (KEDA)

<!--
https://github.com/devjoes/github-runner-autoscaler

https://dev.to/k6/how-to-autoscale-kubernetes-pods-with-keda-testing-with-k6-4nl9
https://blog.devgenius.io/auto-scaling-kubernetes-keda-part-1-d7638d67ea17
https://itnext.io/tutorial-auto-scale-your-kubernetes-apps-with-prometheus-and-keda-c6ea460e4642
-->

**Keywords:** Kubernetes Autoscaling

## Links

- [Code Repository](https://github.com/kedacore/keda)
- [Main Website](https://keda.sh/)

## Helm

### References

- [Configuration](https://github.com/kedacore/charts/tree/master/keda#configuration)

### Repository

```sh
helm repo add kedacore 'https://kedacore.github.io/charts'
helm repo update
```

### Install

```sh
#
kubectl create ns keda-system
```

```sh
helm install keda kedacore/keda \
  --namespace keda-system \
  --version 2.3.2
```

### Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
helm upgrade keda kedacore/keda \
  --namespace keda-system \
  -f <(yq m <(cat << EOF
prometheus:
  metricServer:
    enabled: true
    podMonitor:
      enabled: true
      additionalLabels:
        release: prometheus-stack

  operator:
    enabled: true
    podMonitor:
      enabled: true
      additionalLabels:
        release: prometheus-stack
EOF
) <(helm get values keda --namespace keda-system))
```

### Status

```sh
kubectl rollout status deploy/keda-operator \
  -n keda-system
```

### Logs

```sh
kubectl logs \
  -l 'app=keda-operator' \
  -n keda-system \
  -f
```

<!-- ###

```sh
#
cat << EOF | kubectl apply \
  -n \
  -f -
apiVersion: keda.k8s.io/v1alpha1
kind: ScaledObject
metadata:
  name: prometheus-scaledobject
  namespace: default
  labels:
    deploymentName: go-prom-app
spec:
  scaleTargetRef:
    deploymentName: go-prom-app
  pollingInterval: 15
  cooldownPeriod:  30
  minReplicaCount: 1
  maxReplicaCount: 10
  triggers:
  - type: prometheus
    metadata:
      serverAddress: http://prometheus-service.default.svc.cluster.local:9090
      metricName: access_frequency
      threshold: '3'
      query: sum(rate(http_requests[2m]))
EOF

#
kubectl get hpa -A
``` -->

### Delete

```sh
helm uninstall keda \
  -n keda-system

kubectl delete ns keda-system \
  --grace-period=0 \
  --force
```
