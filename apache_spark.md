# Apache Spark

http://shop.oreilly.com/product/0636920047568.do
https://www.jowanza.com/blog/time-series-missing-data-imputation-in-apache
https://www.jowanza.com/blog/a-gentle-intro-to-udafs-in-apache-spark
https://www.jowanza.com/blog/the-how-and-why-of-spark-and-couchbase

## Helm

### Install

```sh
kubectl create namespace spark
```

```sh
helm install stable/spark \
  -n spark \
  --namespace spark \
  --set Master.ServiceType=ClusterIP \
  --set Zeppelin.Ingress.Enabled=true \
  --set Zeppelin.ServiceType=ClusterIP \
  --set Zeppelin.Ingress.Hosts={zeppelin.$(minikube ip).nip.io} \
  --set Zeppelin.Persistence.Config.Enabled=true \
  --set Zeppelin.Persistence.Config.StorageClass=$(kubectl get storageclass -o jsonpath='{.items[0].metadata.name}') \
  --set Zeppelin.Persistence.Notebook.Enabled=true \
  --set Zeppelin.Persistence.Notebook.StorageClass=$(kubectl get storageclass -o jsonpath='{.items[0].metadata.name}')
```

### Delete

```sh
helm delete spark --purge
kubectl delete namespace spark --grace-period=0 --force
```
