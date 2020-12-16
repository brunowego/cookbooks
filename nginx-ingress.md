# NGINX Ingress

## Minikube

### Enable

```sh
minikube addons enable ingress
```

### Disable

```sh
minikube addons disable ingress
```

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/nginx-ingress#configuration)
- [Exposing TCP and UDP services](https://kubernetes.github.io/ingress-nginx/user-guide/exposing-tcp-udp-services/)

### Install

```sh
helm install stable/nginx-ingress \
  -n nginx-ingress \
  --namespace kube-system \
  --set controller.publishService.enabled=true
```

### SSL

### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n default
```

```sh
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq w <(helm get values nginx-ingress) controller.extraArgs.default-ssl-certificate default/example.tls-secret)
```

#### Remove

```sh
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq d <(helm get values nginx-ingress) controller.extraArgs.default-ssl-certificate)

kubectl delete secret example.tls-secret -n default
```

### Status

```sh
kubectl rollout status deploy/nginx-ingress-controller -n kube-system
```

### Logs

```sh
kubectl logs -l 'app=nginx-ingress,component=controller' -n kube-system -f
kubectl logs -l 'app=nginx-ingress,component=default-backend' -n kube-system -f
```

### DNS

```sh
dig @10.96.0.10 nginx-ingress-default-backend.kube-system.svc.cluster.local +short
nslookup nginx-ingress-default-backend.kube-system.svc.cluster.local 10.96.0.10
```

### Tips

#### HTTP Strict Transport Security (HSTS)

```yml
nginx.ingress.kubernetes.io/server-snippet: |
  add_header Strict-Transport-Security "max-age=63072000; includeSubDomains" always;
```

#### Minikube Tunnel

```log
; (1 server found)
;; global options: +cmd
;; connection timed out; no servers could be reached
```

```sh
minikube tunnel
```

### Delete

```sh
helm delete nginx-ingress --purge
```
