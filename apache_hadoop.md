# Apache Hadoop

<!--
https://www.jowanza.com/blog/which-hadoop-file-format-should-i-use
-->

## Helm

### Install

```sh
kubectl create namespace hadoop
```

```sh
helm install stable/hadoop \
  -n hadoop \
  --namespace hadoop \
  --set hdfs.webhdfs.enabled=true \
  --set persistence.nameNode.enabled=true \
  --set persistence.nameNode.storageClass=$(kubectl get storageclass -o jsonpath='{.items[0].metadata.name}') \
  --set persistence.nameNode.size=5Gi \
  --set persistence.dataNode.enabled=true \
  --set persistence.dataNode.storageClass=$(kubectl get storageclass -o jsonpath='{.items[0].metadata.name}') \
  --set persistence.dataNode.size=20Gi

  # concatenate with this to calc resources
  $(curl https://raw.githubusercontent.com/helm/charts/master/stable/hadoop/tools/calc_resources.sh | /bin/bash -s -- 50)
```

```sh
helm status hadoop
```

### Delete

```sh
helm delete hadoop --purge
kubectl delete namespace hadoop --grace-period=0 --force
```
