# TensorFlow Serving

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/tensorflow-serving#configuration)

### Install

```sh
kubectl create ns tensorflow-serving
```

```sh
helm install mnist stable/tensorflow-serving \
  --namespace tensorflow-serving \
  --set serviceType=ClusterIP \
  --set modelName='mnist' \
  --set modelBasePath='/serving/model/mnist' \
  --set mountPath='/serving/model/mnist'
```

### Status

```sh
kubectl rollout status deploy/mnist-tensorflow-serving -n tensorflow-serving
```

### Logs

```sh
kubectl logs -l 'app=tensorflow-serving' -n tensorflow-serving -f
```

### DNS

```sh
dig @10.96.0.10 mnist-tensorflow-serving.tensorflow-serving.svc.cluster.local +short
nslookup mnist-tensorflow-serving.tensorflow-serving.svc.cluster.local 10.96.0.10
```

### Delete

```sh
helm uninstall mnist -n mnist
kubectl delete ns tensorflow-serving --grace-period=0 --force
```
