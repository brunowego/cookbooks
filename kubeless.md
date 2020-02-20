# Kubeless

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/incubator/kubeless#configuration)

### Repository

```sh
helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com
helm update
```

### Install

```sh
kubectl create namespace kubeless
```

```sh
helm install incubator/kubeless \
  -n kubeless \
  --namespace kubeless \
  --set rbac.create=true \
  --set ui.enabled=true \
  --set ui.ingress.enabled=true \
  --set ui.ingress.hosts={kubeless.$(minikube ip).nip.io} \
  --set kafkaTrigger.enabled=true
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n kubeless
```

```sh
helm upgrade kubeless incubator/kubeless -f <(yq m <(cat << EOF
ui:
  ingress:
    tls:
      - secretName: example.tls-secret
        hosts:
          - kubeless.$(minikube ip).nip.io
EOF
) <(helm get values kubeless))
```

#### Remove

```sh
helm upgrade kubeless incubator/kubeless -f <(yq d <(helm get values kubeless) ingress.tls)

kubectl delete secret example.tls-secret -n kubeless
```

### Status

```sh
kubectl rollout status deploy/kubeless-kubeless-controller-manager -n kubeless
```

### Logs

```sh
kubectl logs -c kubeless-function-controller -l 'app=kubeless,kubeless=controller' -n kubeless -f
kubectl logs -c http-trigger-controller -l 'app=kubeless,kubeless=controller' -n kubeless -f
kubectl logs -c cronjob-trigger-controller -l 'app=kubeless,kubeless=controller' -n kubeless -f
```

### DNS

```sh
dig @10.96.0.10 kubeless-kubeless-ui.kubeless.svc.cluster.local +short
nslookup kubeless-kubeless-ui.kubeless.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "kubeless.$(minikube ip).nip.io" +short
nslookup "kubeless.$(minikube ip).nip.io" 10.96.0.10
```

### Delete

```sh
helm delete kubeless --purge
kubectl delete namespace kubeless --grace-period=0 --force
```

## CLI

### Installation

#### Homebrew

```sh
brew install kubeless
```
