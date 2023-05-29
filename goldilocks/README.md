# Goldilocks

**Keywords:** Kubernetes Resource Requests

## Links

- [Code Repository](https://github.com/FairwindsOps/goldilocks)
- [Main Website](https://fairwinds.com/goldilocks)

## Glossary

- Quality of Service (QoS)
- Vertical Pod Autoscaler (VPA)

## Helm

### Dependencies

- [Vertical Pod Autoscaler (VPA)](/kubernetes/autoscaler/vertical-pod-autoscaler.md)
- For Testing
  - [Grafana](/grafana/README.md#helm)
    - [Vertical Pod Autoscaler (VPA)](/grafana/README.md#vertical-pod-autoscaler-vpa)

### References

- [Values](https://github.com/FairwindsOps/charts/tree/master/stable/goldilocks#values)

### Repository

```sh
helm repo add fairwinds-stable 'https://charts.fairwinds.com/stable'
helm repo update
```

### Install

```sh
#
kubectl create ns goldilocks
# kubectl create ns performance

#
kubens goldilocks

#
helm search repo -l fairwinds-stable/goldilocks

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install goldilocks fairwinds-stable/goldilocks \
  --version 6.6.0 \
  -f <(cat << EOF
dashboard:
  ingress:
    enabled: true
    ingressClassName: nginx
    # annotations:
    #   cert-manager.io/cluster-issuer: letsencrypt-issuer
    hosts:
      - host: goldilocks.${DOMAIN}
        paths:
          - path: /
            type: ImplementationSpecific
    # tls:
    #   - secretName: goldilocks.tls-secret
    #     hosts:
    #       - goldilocks.${DOMAIN}
EOF
)
```

### Status

```sh
kubectl rollout status deploy/goldilocks-dashboard
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=dashboard' \
  -f
```

### Configuration

```sh
#
kubectl get ns

#
kubectl label namespace <namespace> goldilocks.fairwinds.com/enabled=true

#
kubectl describe ns <namespace>
```

<!-- ### Tips -->

<!-- ####

```sh
#
aws eks list-clusters --region us-east-1

#
aws eks list-nodegroups --cluster-name <cluster-name> --region us-east-1
``` -->

### Issues

#### Missing VPA

```log
Error running summary.
```

```log
E0527 16:40:49.241331       1 summary.go:250] the server could not find the requested resource (get verticalpodautoscalers.autoscaling.k8s.io)
E0527 16:40:49.241401       1 dashboard.go:64] Error getting vpaData: the server could not find the requested resource (get verticalpodautoscalers.autoscaling.k8s.io)
```

```sh
#
kubectl logs \
  -l 'app.kubernetes.io/component=dashboard' \
  -f
```

Just install [Vertical Pod Autoscaler (VPA)](/kubernetes/autoscaler/vertical-pod-autoscaler.md).

#### TBD

```log
No workloads found in this namespace.
```

<!--
Wait!
-->

TODO

### Delete

```sh
helm uninstall goldilocks

kubectl delete ns goldilocks \
  --grace-period=0 \
  --force
```
