# Go Continuous Delivery (GoCD)

**Keywords:** Continuous Integration, Continuous Delivery

## Links

- [Code Repository](https://github.com/gocd/gocd)
- [Main Website](https://gocd.org/)

## Helm

### References

- [Configuration](https://github.com/gocd/helm-chart/tree/master/gocd#configuration)

### Repository

```sh
helm repo add gocd 'https://gocd.github.io/helm-chart'
helm repo update
```

### Install

```sh
#
kubectl create ns gocd-system
# kubectl create ns pipeline

#
helm search repo -l gocd/gocd

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install gocd gocd/gocd \
  --namespace gocd-system \
  --version 2.0.0 \
  -f <(cat << EOF
server:
  ingress:
    enabled: true
    ingressClassName: nginx
    hosts:
    - gocd.${DOMAIN}
EOF
)

#
kubectl get all -n gocd-system
```

### Status

```sh
kubectl rollout status deployment/gocd-server \
  -n gocd-system
```

### Logs

```sh
kubectl logs \
  -l 'app=gocd' \
  -n gocd-system \
  -f
```

### Secret

```sh
kubectl get secret "$(kubectl get serviceaccount gocd -n gocd-system -o jsonpath='{.secrets[0].name}')" \
  -o jsonpath='{.data.token}' \
  -n gocd-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall gocd \
  -n gocd-system

kubectl delete ns gocd-system \
  --grace-period=0 \
  --force
```
