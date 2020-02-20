# TensorFlow Inception

TODO

## Helm

### Repository

```sh
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm repo update incubator
```

### Install

```sh
kubectl create namespace tensorflow-inception
```

```sh
helm install incubator/tensorflow-inception \
  -n tensorflow-inception \
  --namespace tensorflow
```

### Test

```sh
export INCEPTION_SERVICE_IP=$(kubectl get service tensorflow-inception-ten -o jsonpath='{.status.loadBalancer.ingress[0].ip}' -n tensorflow-inception )
```

```sh
docker run --rm \
  -v ~/Downloads:/downloads \
  quay.io/lachie83/inception_serving /serving/bazel-bin/tensorflow_serving/example/inception_client \
    --server=$INCEPTION_SERVICE_IP:9090 \
    --image=/downloads/dog.jpg
```

### Delete

```sh
helm delete tensorflow-inception --purge
kubectl delete namespace tensorflow-inception --grace-period=0 --force
```
