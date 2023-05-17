# TensorFlow Notebook

## Helm

### Install

```sh
kubectl create ns kube-monitor
```

```sh
helm install tensorflow-notebook stable/tensorflow-notebook \
  --namespace tensorflow \
  --set jupyter.password=mytest \
  --set service.type=ClusterIP
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: tensorboard
  namespace: tensorflow-notebook
spec:
  rules:
  - host: tensorboard.domain.tld
    http:
      paths:
      - backend:
          serviceName: tensorflow-notebook
          servicePort: 6006
        path: /
EOF
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: jupyter
  namespace: tensorflow-notebook
spec:
  rules:
  - host: jupyter.domain.tld
    http:
      paths:
      - backend:
          serviceName: tensorflow-notebook
          servicePort: 8888
        path: /
EOF
```

### Delete

```sh
helm uninstall tensorflow-notebook -n tensorflow-notebook
kubectl delete ns tensorflow-notebook --grace-period=0 --force
```
