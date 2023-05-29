# Vertical Pod Autoscaler (VPA)

## Links

- [Code Repository](https://github.com/kubernetes/autoscaler/blob/master/vertical-pod-autoscaler)

## Articles

- [Setting the right requests and limits in Kubernetes](https://learnk8s.io/setting-cpu-memory-limits-requests)

## Dependencies

- [Metrics Server](/kubernetes/metrics-server.md)

## Helm

### References

- [Values](https://github.com/FairwindsOps/charts/tree/master/stable/vpa#values)

### Repository

```sh
helm repo add fairwinds-stable 'https://charts.fairwinds.com/stable'
helm repo update
```

### Install

```sh
#
kubectl create ns vpa
# kubectl create ns autoscaler

#
kubens vpa

#
helm search repo -l fairwinds-stable/vpa

#
helm install vpa fairwinds-stable/vpa \
  --version 1.7.5
```

### Status

```sh
kubectl rollout status deploy/vpa-recommender
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=recommender' \
  -f
```

### Delete

```sh
helm uninstall vpa

kubectl delete ns vpa \
  --grace-period=0 \
  --force
```
