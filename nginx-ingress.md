# NGINX Ingress

## Helm

### Install

```sh
kubectl create namespace nginx-ingress
```

```sh
helm install stable/nginx-ingress \
  -n nginx-ingress \
  --namespace nginx-ingress \
  --set controller.publishService.enabled=true
```

```sh
kubectl rollout status deploy/nginx-ingress-controller -n nginx-ingress
```

#### Minikube

```sh
minikube tunnel
```

```sh
echo -e "[INFO]\thttp://$(kubectl get service nginx-ingress-controller -o jsonpath='{.status.loadBalancer.ingress[*].ip}' -n nginx-ingress)"
```

### Delete

```sh
helm delete nginx-ingress --purge
kubectl delete namespace nginx-ingress
```
