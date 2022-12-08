# Teleport Kubernetes Service

**WIP:** Currently not working as expected.

## Docs

- [Guides](https://github.com/gravitational/teleport/tree/master/docs/pages/kubernetes-access/guides)

## Example

### Permissions

```sh
#
kubectl get role -A

#
cat << EOF | kubectl apply -f -
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: developer
rules:
- apiGroups:
  - ''
  resources:
  - pods
  - pods/log
  verbs:
  - get
  - list
  - watch
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: developer-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: developer
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: Group
  name: developer
EOF

#
kubectl get role

#
cat << EOF | tctl create -f
---
kind: role
version: v5
metadata:
  name: developer
spec:
  allow:
    kubernetes_groups: ['developer']
    kubernetes_labels:
      '*': '*'
EOF

#
tctl get role/developer

#
tctl tokens add \
  --type node \
  --ttl 10m

#
export TELEPORT_CLUSTER_NAME='<cluster-name>'
export TELEPORT_TOKEN='<token>'
export TELEPORT_TUNNEL_ADDR='<tunnel-addr>'
export TELEPORT_WEB_PROXY_ADDR='<web-proxy-addr>'

#
cat << EOF | tctl create -f
---
kind: trusted_cluster
version: v2
metadata:
  name: $TELEPORT_CLUSTER_NAME
spec:
  enabled: true
  token: $TELEPORT_TOKEN
  tunnel_addr: $TELEPORT_TUNNEL_ADDR:3024
  web_proxy_addr: $TELEPORT_WEB_PROXY_ADDR:3080
  role_map:
    - remote: '*'
      local: ['admin']
EOF

#
tctl get trusted_cluster
```

### Configuration

```sh
#
tsh kube ls

#
tsh kube login <cluster-name>

#
kubectl exec -it shell-demo -- /bin/bash

#
tctl users add janedoe \
  --roles developer \
  --logins root,ubuntu,ec2-user

#
tsh logout

#
tsh login --user janedoe

#
kubectl get pods
kubectl get pods -A

#
kubectl exec -it shell-demo -- /bin/bash
```
