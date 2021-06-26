# RabbitMQ Operator

## Links

- [RabbitMQ Cluster Operator for Kubernetes](https://www.rabbitmq.com/kubernetes/operator/operator-overview.html)

##

```sh
kubectl get secrets \
  -n [namespace] \
  [pod-name] \
  -o jsonpath='{.data.password}' | \
    base64 --decode

kubectl get secrets \
  -n [namespace] \
  [pod-name] \
  -o jsonpath='{.data.username}' | \
    base64 --decode
```
