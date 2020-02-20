# Vault

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/incubator/vault#configuration)

### Requirements

- [Consul](/consul.md)

### Repository

```sh
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm repo update incubator
```

### Install

```sh
kubectl create namespace vault
```

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n vault
```

```sh
helm install incubator/vault \
  -n vault \
  --namespace vault \
  --set vault.dev=false \
  # --set vault.config.storage.consul.address=consul.$(minikube ip).nip.io \
  --set ingress.enabled=true \
  --set ingress.hosts={vault.$(minikube ip).nip.io} \
  --set 'ingress.tls[0].secretName=example.tls-secret' \
  --set "ingress.tls[0].hosts={vault.$(minikube ip).nip.io}"
```

### Logs

```sh
kubectl logs $(kubectl get pod -l 'app=vault' -o jsonpath='{.items[0].metadata.name}' -n vault) -n vault -f
```

### Secret

```sh
kubectl get secret vault \
  -o jsonpath='{.data.admin-password}' \
  -n vault | \
    base64 --decode; echo
```

### Issues

<!-- #### Server Misbehaving

```log
2019-09-05T12:21:15.421Z [WARN]  storage migration check error: error="Get http://consul.example.com/v1/kv/vault/core/migration: dial tcp: lookup consul.example.com on 10.96.0.10:53: server misbehaving"
```

```sh
minikube ssh -- sudo cat /etc/hosts
```

```sh
minikube ssh -- 'sudo /usr/bin/sh -c "echo -e \"127.0.0.1\tconsul.example.com\" >> /etc/hosts"'
``` -->

### Delete

```sh
helm delete vault --purge
kubectl delete namespace vault --grace-period=0 --force
```
