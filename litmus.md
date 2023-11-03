# Litmus

**Keywords:** Chaos Engineering

## Links

- [Code Repository](https://github.com/litmuschaos/litmus)
- [Main Website](https://litmuschaos.io)
- [ChaosHub](https://hub.litmuschaos.io)

## Helm

### References

- [Values](https://github.com/litmuschaos/litmus-helm/tree/master/charts/litmus#values)

### Repository

```sh
helm repo add litmuschaos 'https://litmuschaos.github.io/litmus-helm'
helm repo update
```

### Install

```sh
#
kubectl create ns litmus
# kubectl create ns chaos-engineering

#
kubens litmus

#
helm search repo -l litmuschaos/litmus

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install litmus litmuschaos/litmus \
  --version 2.15.10 \
  -f <(cat << EOF
ingress:
  enabled: true
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /\$1
  ingressClassName: nginx
  host:
    name: litmus.${K8S_DOMAIN}
EOF
)
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/litmus-frontend-service \
  9091:9091
-->

### Status

```sh
kubectl rollout status deploy/litmus-frontend
```

### Logs

```sh
#
kubectl logs \
  -l 'app.kubernetes.io/component=mongodb' \
  -f

#
kubectl logs \
  -l 'app.kubernetes.io/component=litmus-auth-server' \
  -f

#
kubectl logs \
  -l 'app.kubernetes.io/component=litmus-server' \
  -f

#
kubectl logs \
  -l 'app.kubernetes.io/component=litmus-frontend' \
  -f
```

### Secret

```sh
#
kubectl get secret litmus-admin-secret \
  -o jsonpath='{.data.ADMIN_PASSWORD}' | \
    base64 -d; echo
```

<!--
Username: admin
Password: litmus
-->

### Delete

```sh
helm uninstall litmus

kubectl delete ns litmus \
  --grace-period=0 \
  --force
```
