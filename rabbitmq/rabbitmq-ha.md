# RabbitMQ High Availability (HA)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/rabbitmq-ha#configuration)

### Install

```sh
kubectl create ns rabbitmq-ha
```

```sh
helm install rabbitmq-ha stable/rabbitmq-ha \
  --namespace rabbitmq-ha \
  --set ingress.enabled=true \
  --set ingress.hostName=rabbitmq.example.com
```

### Logs

```sh
kubectl logs \
  -l 'app=rabbitmq-ha' \
  -n rabbitmq-ha \
  -f
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
    base64 -d; echo

kubectl get secret rabbitmq-ha \
  -o jsonpath='{.data.rabbitmq-management-password}' \
  -n rabbitmq-ha | \
    base64 -d; echo

kubectl get secret rabbitmq-ha \
  -o jsonpath='{.data.rabbitmq-erlang-cookie}' \
  -n rabbitmq-ha | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall rabbitmq-ha \
  -n rabbitmq-ha

kubectl delete ns rabbitmq-ha \
  --grace-period=0 \
  --force
```
