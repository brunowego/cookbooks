# Ambassador

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/ambassador#configuration)

### Install

```sh
kubectl create namespace ambassador
```

```sh
helm install stable/ambassador \
  -n ambassador \
  --namespace ambassador \
  --set crds.keep=false \
  --set service.type=ClusterIP
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ambassador
  namespace: ambassador
spec:
  rules:
    - host: ambassador.example.com
      http:
        paths:
          - backend:
              serviceName: ambassador
              servicePort: 80
            path: /
EOF
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ambassador-admin
  namespace: ambassador
spec:
  rules:
    - host: admin.ambassador.example.com
      http:
        paths:
          - backend:
              serviceName: ambassador-admin
              servicePort: 8877
            path: /
EOF
```

| Ingress | URL |
| --- | --- |
| Admin | `http://admin.ambassador.example.com/ambassador/v0/diag/` |

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n ambassador
```

```sh
kubectl apply -f <(yq m <(cat << EOF
spec:
  tls:
    - hosts:
        - ambassador.example.com
      secretName: example.tls-secret
EOF
) <(kubectl get ingress ambassador -n ambassador -o yaml))
```

```sh
kubectl apply -f <(yq m <(cat << EOF
spec:
  tls:
    - hosts:
        - admin.ambassador.example.com
      secretName: example.tls-secret
EOF
) <(kubectl get ingress ambassador-admin -n ambassador -o yaml))
```

#### Remove

```sh
yq d <(kubectl get ingress ambassador -n ambassador -o yaml) spec.tls | kubectl apply -f -
yq d <(kubectl get ingress ambassador-admin -n ambassador -o yaml) spec.tls | kubectl apply -f -

kubectl delete secret example.tls-secret -n ambassador
```

### Status

```sh
kubectl rollout status deploy/ambassador -n ambassador
```

### Logs

```sh
kubectl logs -l 'app.kubernetes.io/name=ambassador' -n ambassador -f
```

### DNS

```sh
dig @10.96.0.10 ambassador.ambassador.svc.cluster.local +short
nslookup ambassador.ambassador.svc.cluster.local 10.96.0.10

dig @10.96.0.10 ambassador-admin.ambassador.svc.cluster.local +short
nslookup ambassador-admin.ambassador.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 ambassador.example.com +short
nslookup ambassador.example.com 10.96.0.10

dig @10.96.0.10 admin.ambassador.example.com +short
nslookup admin.ambassador.example.com 10.96.0.10
```

### Delete

```sh
helm delete ambassador --purge
kubectl delete namespace ambassador --grace-period=0 --force

kubectl get crd -o json | jq -r '.items[] | select(.spec.group | contains("getambassador.io")) | .metadata.name' | xargs kubectl delete crd
```
