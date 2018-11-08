# Dashboard

## Helm

- [Reference](https://github.com/helm/charts/tree/master/stable/kubernetes-dashboard)

```sh
helm repo update
helm install stable/kubernetes-dashboard -n kubernetes-dashboard --namespace kube-system
```

##

###

```sh
kubectl create serviceaccount dashboard -n default
```

```sh
kubectl create clusterrolebinding dashboard-admin -n default --clusterrole=cluster-admin --serviceaccount=default:dashboard
```

###

```sh
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: dashboard
  namespace: default
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: dashboard-admin
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: dashboard
    namespace: default
EOF
```

### Port Forward

```sh
export POD_NAME=$(kubectl get pod -n kube-system -l 'app=kubernetes-dashboard,release=kubernetes-dashboard' -o jsonpath='{.items[0].metadata.name}'); echo $POD_NAME
```

```sh
until kubectl get pods -n kube-system | grep kubernetes-dashboard &> /dev/null; do sleep 1; done
```

```sh
until [ 'true' == "$(kubectl get pod -n kube-system $POD_NAME -o json | jq -r .status.containerStatuses[0].ready)" ]; do sleep 1; done
```

```sh
nohup kubectl port-forward --address 0.0.0.0 $POD_NAME 8443:8443 -n kube-system &> /dev/null &
```

#### Stop

```sh
kill -9 "$(lsof -nPi tcp:8443 | grep LISTEN | awk '{print $2}')"
```

### Token

```sh
kubectl get secret $(kubectl get serviceaccount dashboard -n default -o jsonpath='{.secrets[0].name}') -n default -o jsonpath='{.data.token}' | base64 --decode; echo
```
