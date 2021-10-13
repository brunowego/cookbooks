# Fluentd Operator

## Links

- [Code Repository](https://github.com/vmware/kube-fluentd-operator)

## Helm

### References

- [Chart Repository](https://github.com/vmware/kube-fluentd-operator/tree/master/charts/log-router)

### Dependencies

- Assuming there is already a `logging` namespace.

### Install

```sh
helm install fluentd-operator 'https://github.com/vmware/kube-fluentd-operator/releases/download/v1.15.2/log-router-0.4.0.tgz' \
  --namespace logging \
  -f <(cat << EOF
rbac:
  create: true

logRotate:
  enabled: true
EOF
)
```

<!--
prometheusEnabled: false
serviceMonitor:
  enabled: true
-->

### Status

```sh
kubectl rollout status daemonset/fluentd-operator-log-router \
  -n logging
```

### Logs

```sh
kubectl logs \
  -l 'release=fluentd-operator' \
  -n logging \
  -c fluentd \
  -f

kubectl logs \
  -l 'release=fluentd-operator' \
  -n logging \
  -c reloader \
  -f
```

<!-- ###

```sh
#
kubectl create configmap fluentd-config \
  --from-file=fluent.conf=<(cat << EOF
<match **>
  @type null
</match>
EOF
) \
  -n default

#
kubectl annotate namespace default \
  logging.csp.vmware.com/fluentd-configmap=fluentd-config

#
kubectl get namespace default \
  -o jsonpath='{.metadata.annotations.logging\.csp\.vmware\.com/fluentd-status}'
``` -->

### Delete

```sh
helm uninstall fluentd-operator \
  -n logging
```
