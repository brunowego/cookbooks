# Kubecost

## Helm

### References

- [Kubecost helm chart](https://github.com/kubecost/cost-analyzer-helm-chart#kubecost-helm-chart)

### Repository

```sh
helm repo add kubecost https://kubecost.github.io/cost-analyzer
helm repo update kubecost
```

### Install

```sh
kubectl create namespace kubecost
```

```sh
helm install kubecost/cost-analyzer \
  -n kubecost \
  --namespace kubecost \
  --set ingress.enabled=true \
  --set ingress.hosts={kubecost.$(minikube ip).nip.io} \
  --set networkPolicy.enabled=true \
  --set networkCosts.enabled=true
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: kubecost-grafana
  namespace: kubecost
spec:
  rules:
    - host: grafana.$(minikube ip).nip.io
      http:
        paths:
          - backend:
              serviceName: kubecost-grafana
              servicePort: 80
            path: /
EOF
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: kubecost-prometheus-alertmanager
  namespace: kubecost
spec:
  rules:
    - host: alertmanager.$(minikube ip).nip.io
      http:
        paths:
          - backend:
              serviceName: kubecost-prometheus-alertmanager
              servicePort: 80
            path: /
EOF
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: kubecost-prometheus-server
  namespace: kubecost
spec:
  rules:
    - host: prometheus.$(minikube ip).nip.io
      http:
        paths:
          - backend:
              serviceName: kubecost-prometheus-server
              servicePort: 80
            path: /
EOF
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n kubecost
```

```sh
helm upgrade kubecost stable/cost-analyzer -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - kubecost.$(minikube ip).nip.io
EOF
) <(helm get values kubecost))
```

#### Remove

```sh
helm upgrade kubecost stable/cost-analyzer -f <(yq d <(helm get values kubecost) ingress.tls)

kubectl delete secret example.tls-secret -n kubecost
```

### Status

```sh
kubectl rollout status deploy/kubecost-cost-analyzer -n kubecost
```

### Logs

```sh
kubectl logs -l 'app=cost-analyzer' -c cost-analyzer-frontend -n kubecost -f
kubectl logs -l 'app=cost-analyzer' -c cost-analyzer-server -n kubecost -f
kubectl logs -l 'app=cost-analyzer' -c cost-model -n kubecost -f
```

### DNS

```sh
dig @10.96.0.10 kubecost-cost-analyzer.kubecost.svc.cluster.local +short
nslookup kubecost-cost-analyzer.kubecost.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "kubecost.$(minikube ip).nip.io" +short
nslookup "kubecost.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret kubecost-grafana \
  -o jsonpath='{.data.admin-password}' \
  -n kubecost | \
    base64 --decode; echo
```

### Delete

```sh
helm delete kubecost --purge
kubectl delete namespace kubecost --grace-period=0 --force
```
