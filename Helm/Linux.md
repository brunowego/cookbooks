# Linux

## Installation

```sh
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash
```

## Creating

### Option 1

```sh
kubectl create serviceaccount tiller -n kube-system
```

```sh
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
```

### Option 2

```sh
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: tiller
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: tiller-cluster-rule
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: tiller
    namespace: kube-system
EOF
```

## Initialize

```sh
helm init --service-account tiller
```

### Skip Refresh

```sh
helm init \
  --service-account tiller \
  --skip-refresh --wait
```
