# Spark Operator

## Helm

### References

- [Quick Start Guide](https://github.com/GoogleCloudPlatform/spark-on-k8s-operator/blob/master/docs/quick-start-guide.md)
- [Who Is Using](https://github.com/GoogleCloudPlatform/spark-on-k8s-operator/blob/master/docs/who-is-using.md)

### Repository

```sh
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm repo update
```

### Install

```sh
#
kubectl create ns spark-operator

#
helm install spark-operator incubator/sparkoperator \
  --namespace spark \
  --set serviceAccounts.spark.name=spark \
  --set sparkJobNamespace=default \
  --set enableWebhook=true
```

#### Tips

- Use spark job mamespace as `spark-jobs` on production.

### Test

```sh
#
kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/spark-on-k8s-operator/master/examples/spark-pi.yaml

#
kubectl get sparkapplications -A

#
kubectl describe sparkapplication spark-pi -n default
```

### Delete

```sh
helm uninstall spark-operator -n spark-operator

kubectl delete ns spark-operator --grace-period=0 --force
```
