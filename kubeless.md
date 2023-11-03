# Kubeless

## Links

- [Code Repository](https://github.com/kubeless/kubeless)
- [Main Website](https://kubeless.io/)

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
kubectl create ns kubeless
```

```sh
helm install kubeless incubator/kubeless \
  --namespace kubeless \
  --set rbac.create=true \
  --set ui.enabled=true \
  --set ui.ingress.enabled=true \
  --set ui.ingress.hosts={kubeless.${K8S_DOMAIN}} \
  --set kafkaTrigger.enabled=true
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls kubeless.tls-secret \
  --cert='/etc/ssl/certs/kubeless/root-ca.crt' \
  --key='/etc/ssl/private/kubeless/root-ca.key' \
  -n kubeless
```

```sh
helm upgrade kubeless incubator/kubeless -f <(yq m <(cat << EOF
ui:
  ingress:
    tls:
      - secretName: kubeless.tls-secret
        hosts:
          - kubeless.${K8S_DOMAIN}
EOF
) <(helm get values kubeless))
```

#### Remove

```sh
helm upgrade kubeless incubator/kubeless -f <(yq d <(helm get values kubeless) ingress.tls)

kubectl delete secret kubeless.tls-secret -n kubeless
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
dig @10.96.0.10 "kubeless.${K8S_DOMAIN}" +short
nslookup "kubeless.${K8S_DOMAIN}" 10.96.0.10
```

### Delete

```sh
helm uninstall kubeless -n kubeless
kubectl delete ns kubeless --grace-period=0 --force
```

## CLI

### Installation

#### Homebrew

```sh
brew install kubeless
```

### Commands

```sh
kubeless -h
```
