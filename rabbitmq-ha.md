# RabbitMQ High Availability

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/rabbitmq-ha#configuration)

### Install

```sh
kubectl create namespace rabbitmq-ha
```

```sh
helm install stable/rabbitmq-ha \
  -n rabbitmq-ha \
  --namespace rabbitmq-ha \
  --set ingress.enabled=true \
  --set ingress.hostName=rabbitmq.example.com
```

### SSL

### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n rabbitmq-ha
```

```sh
helm upgrade rabbitmq-ha stable/rabbitmq-ha -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - rabbitmq.example.com
EOF
) <(helm get values rabbitmq-ha))
```

#### Remove

```sh
helm upgrade rabbitmq-ha stable/rabbitmq-ha -f <(yq d <(helm get values rabbitmq-ha) ingress.tls)

kubectl delete secret example.tls-secret -n rabbitmq-ha
```

### Logs

```sh
kubectl logs -l 'app=rabbitmq-ha' -n rabbitmq-ha -f
```

### DNS

```sh
dig @10.96.0.10 rabbitmq-ha.rabbitmq-ha.svc.cluster.local +short
nslookup rabbitmq-ha.rabbitmq-ha.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 rabbitmq.example.com +short
nslookup rabbitmq.example.com 10.96.0.10
```

### Secret

```sh
kubectl get secret rabbitmq-ha \
  -o jsonpath='{.data.rabbitmq-password}' \
  -n rabbitmq-ha | \
    base64 --decode; echo

kubectl get secret rabbitmq-ha \
  -o jsonpath='{.data.rabbitmq-management-password}' \
  -n rabbitmq-ha | \
    base64 --decode; echo

kubectl get secret rabbitmq-ha \
  -o jsonpath='{.data.rabbitmq-erlang-cookie}' \
  -n rabbitmq-ha | \
    base64 --decode; echo
```

### Delete

```sh
helm delete rabbitmq-ha --purge
kubectl delete namespace rabbitmq-ha --grace-period=0 --force
```
