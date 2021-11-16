# Kubernetes Dashboard

## Alternatives

- [k9s](/k9s.md)
- [Lens (a.k.a. OpenLens)](/lens.md)
- [Octant](/octant.md)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/kubernetes-dashboard#configuration)

### Install

```sh
helm install kubernetes-dashboard stable/kubernetes-dashboard \
  --namespace kube-system \
  --set ingress.enabled=true \
  --set ingress.hosts={dashboard.example.com} \
  --set rbac.clusterAdminRole=true \
  --set serviceAccount.create=true
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n kube-system
```

```sh
helm upgrade kubernetes-dashboard stable/kubernetes-dashboard -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - dashboard.example.com
EOF
) <(helm get values kubernetes-dashboard))
```

#### Remove

```sh
helm upgrade kubernetes-dashboard stable/kubernetes-dashboard -f <(yq d <(helm get values kubernetes-dashboard) ingress.tls)

kubectl delete secret example.tls-secret -n kube-system
```

### Ingress

#### NGINX

```sh
helm upgrade kubernetes-dashboard stable/kubernetes-dashboard -f <(yq m <(cat << EOF
ingress:
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/force-ssl-redirect: 'true'
    nginx.ingress.kubernetes.io/backend-protocol: HTTPS
EOF
) <(helm get values kubernetes-dashboard))
```

#### Traefik

```sh
helm upgrade kubernetes-dashboard stable/kubernetes-dashboard -f <(yq m <(cat << EOF
ingress:
  annotations:
    kubernetes.io/ingress.class: traefik
    traefik.ingress.kubernetes.io/redirect-entry-point: https
EOF
) <(helm get values kubernetes-dashboard))
```

### Status

```sh
kubectl rollout status deploy/kubernetes-dashboard -n kube-system
```

### Logs

```sh
kubectl logs -l 'app=kubernetes-dashboard' -n kube-system -f
```

### DNS

```sh
dig @10.96.0.10 kubernetes-dashboard.kube-system.svc.cluster.local +short
nslookup kubernetes-dashboard.kube-system.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 dashboard.example.com +short
nslookup dashboard.example.com 10.96.0.10
```

### Secrets

```sh
kubectl get secret $(kubectl get serviceaccount kubernetes-dashboard -n kube-system -o jsonpath='{.secrets[0].name}') \
  -n kube-system \
  -o jsonpath='{.data.token}' | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall kubernetes-dashboard -n kubernetes-dashboard
```

## Custom Resource (CR)

### Install

```sh
#
kubectl apply \
  -f 'https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml'
```

## Secrets

```sh
kubectl get secret \
  --field-selector 'type=kubernetes.io/service-account-token' \
  -n kubernetes-dashboard \
  -o json | \
    jq -r '.items[0].data["token"]' | \
      base64 -d; echo
```

## Proxy

```sh
#
kubectl proxy

#
echo -e "[INFO]\thttp://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy"
```

### Delete

```sh
#
kubectl delete \
  -f 'https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml'
```
