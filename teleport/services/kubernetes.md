# Teleport Kubernetes Service

## Docs

- [Guides](https://github.com/gravitational/teleport/tree/master/docs/pages/kubernetes-access/guides)

## Configuration

```sh
#
tctl users add teleport-admin --roles=editor,access --logins=root,ubuntu,ec2-user

#
tctl users reset <username>

#
tsh login --user=teleport-admin

#
tsh kube ls

#
tsh kube login cookie

#
kubectl exec --stdin --tty shell-demo -- /bin/bash

#
tctl get roles/access

#
tsh status

#
cat << EOF | kubectl apply -f -
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: dev-read
rules:
- apiGroups:
  - ""
  resources:
  - pods
  - pods/log
  verbs:
  - get
  - list
  - watch
EOF

#
cat << EOF | kubectl apply -f -
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: dev-read-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: dev-read
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: Group
  name: developer-read
EOF

#
cat << EOF | tctl create -f
---
kind: role
version: v4
metadata:
  name: developer-read
spec:
  allow:
    kubernetes_groups: ["developer-read"]
    kubernetes_labels:
       '*': '*'
EOF

#
tctl users add bob --roles=developer-read --logins=root,ubuntu,ec2-user

#
tsh logout --user=teleport-admin

#
tsh login --user=bob

#
kubectl get pods

#
kubectl get pods --all-namespaces

#
kubectl exec --stdin --tty shell-demo -- /bin/bash
```
