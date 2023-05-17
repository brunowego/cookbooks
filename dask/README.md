# Dask

<!--
https://app.pluralsight.com/library/courses/scaling-python-data-applications-dask/table-of-contents
-->

## Links

- [Main Website](https://dask.org)

## Helm

### Install

```sh
kubectl create ns dask
```

```sh
helm install dask stable/dask \
  --namespace dask \
  --set scheduler.serviceType=ClusterIP \
  --set jupyter.serviceType=ClusterIP \
  --set jupyter.password='sha1:aae8550c0a44:9507d45e087d5ee481a5ce9f4f16f37a0867318c' # 'dask'
```

```sh
kubectl rollout status deploy/dask-worker -n dask
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: jupyter
  namespace: dask
spec:
  rules:
  - host: jupyter.dask.${DOMAIN}
    http:
      paths:
      - backend:
          serviceName: dask-jupyter
          servicePort: 80
        path: /
EOF
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: webui
  namespace: dask
spec:
  rules:
  - host: dask.${DOMAIN}
    http:
      paths:
      - backend:
          serviceName: dask-scheduler
          servicePort: 80
        path: /
EOF
```

### Delete

```sh
helm uninstall dask -n dask

kubectl delete ns dask --grace-period=0 --force
```
