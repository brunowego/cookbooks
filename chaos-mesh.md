# Chaos Mesh

## Links

- [Code Repository](https://github.com/chaos-mesh/chaos-mesh)
- [Main Website](https://chaos-mesh.org)

## Helm

### References

- [Configuration](https://github.com/chaos-mesh/chaos-mesh/tree/master/helm/chaos-mesh#configuration)

### Repository

```sh
helm repo add chaos-mesh 'https://charts.chaos-mesh.org'
helm repo update
```

### Install

```sh
#
kubectl create ns chaos-mesh
# kubectl create ns chaos-engineering

#
kubens chaos-mesh

#
helm search repo -l chaos-mesh/chaos-mesh

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install chaos-mesh chaos-mesh/chaos-mesh \
  --version 2.5.2 \
  -f <(cat << EOF
dashboard:
  ingress:
    enabled: true
    ingressClassName: nginx
    hosts:
      - name: chaos-mesh.${DOMAIN}
        tls: false
EOF
)
```

### Status

```sh
kubectl rollout status deploy/chaos-dashboard
```

### Logs

```sh
#
kubectl logs \
  -l 'app.kubernetes.io/component=chaos-dashboard' \
  -f
```

###

```sh
#
cat << EOF | kubectl apply -f -
---
kind: ServiceAccount
apiVersion: v1
metadata:
  name: account-cluster-manager-dzfze
---
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: role-cluster-manager-dzfze
rules:
- apiGroups: [""]
  resources: ["pods", "namespaces"]
  verbs: ["get", "watch", "list"]
- apiGroups: ["chaos-mesh.org"]
  resources: [ "*" ]
  verbs: ["get", "list", "watch", "create", "delete", "patch", "update"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: bind-cluster-manager-dzfze
subjects:
- kind: ServiceAccount
  name: account-cluster-manager-dzfze
  namespace: chaos-mesh
roleRef:
  kind: ClusterRole
  name: role-cluster-manager-dzfze
  apiGroup: rbac.authorization.k8s.io
EOF

#
kubectl create token account-cluster-manager-dzfze
```

### Delete

```sh
helm uninstall chaos-mesh

kubectl delete ns chaos-mesh \
  --grace-period=0 \
  --force
```
