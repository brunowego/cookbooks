# TensorFlow Notebook

## Helm

### Install

```sh
kubectl create namespace kube-monitor
```

```sh
helm install stable/tensorflow-notebook \
  -n tensorflow-notebook \
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
    - host: tensorboard.example.com
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
    - host: jupyter.example.com
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
helm delete tensorflow-notebook --purge
kubectl delete namespace tensorflow-notebook --grace-period=0 --force
```
