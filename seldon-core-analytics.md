# Seldon Core Analytics

## Helm

### References

- [Helm Charts](https://github.com/SeldonIO/seldon-core/tree/master/helm-charts)

### Repository

```sh
helm repo add seldon https://storage.googleapis.com/seldon-charts
helm repo update
```

### Install

```sh
kubectl create secret tls seldon.tls-secret \
  --cert='/etc/ssl/certs/seldon/root-ca.crt' \
  --key='/etc/ssl/private/seldon/root-ca.key' \
  -n seldon
```

```sh
helm install seldon-core-analytics seldon/seldon-core-analytics \
  --namespace seldon \
  --set grafana_prom_service_type=ClusterIP \
  --set grafana_prom_admin_password="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)"
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: seldon-core-analytics
  namespace: seldon
spec:
  rules:
    - host: analytics.seldon.xyz.tld
      http:
        paths:
          - backend:
              serviceName: grafana-prom
              servicePort: 80
            path: /
  tls:
    - hosts:
        - analytics.seldon.xyz.tld
      secretName: seldon.tls-secret
EOF
```

### Status

```sh
kubectl rollout status deploy/grafana-prom-deployment -n seldon
```

### Secret

```sh
kubectl get secret grafana-prom-secret \
  -o jsonpath='{.data.grafana-prom-admin-password}' \
  -n seldon | \
    base64 -d; echo
```

<!-- ### Web UI

```sh
kubectl port-forward \
  --address 0.0.0.0 \
  $(kubectl get pods -o jsonpath='{.items[0].metadata.name}' -l app=grafana-prom-server -n seldon) \
  -n seldon \
  3000:3000
``` -->

<!-- ### Issues

#### TBD

```log
Warning  FailedScheduling  46s (x2 over 95s)  default-scheduler  0/5 nodes are available: 4 node(s) didn't match node selector, 5 node(s) didn't have free ports for the requested pod ports.
``` -->

### Delete

```sh
helm uninstall seldon-core-analytics -n seldon-core-analytics
```
