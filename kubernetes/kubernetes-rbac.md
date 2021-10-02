# Kubernetes Role-Based Access Control (RBAC)

<!--
https://www.strongdm.com/blog/kubernetes-rbac-role-based-access-control
https://medium.com/containerum/configuring-permissions-in-kubernetes-with-rbac-a456a9717d5d
-->

## Guides

- [Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

<!-- ## Issues

### Forbidden

```log
error: error upgrading connection: pods "[pod-name]" is forbidden: User "[username]" cannot create resource "pods/portforward" in API group "" in the namespace "[namespace]"
```

```sh
#
cat << EOF |
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: kube-saas:list-and-logs
  namespace: default
rules:
- apiGroups: [""]
  resources: ["pods", "pods/log", pods/portforward]
  verbs: ["get", "list", "create"]
EOF

#
cat << EOF |
apiVersion: rbac.authorization.k8s.io/v1
# This role binding allows "jane" to read pods in the "default" namespace.
# You need to already have a Role named "pod-reader" in that namespace.
kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
# You can specify more than one "subject"
- kind: User
  name: jane # "name" is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  # "roleRef" specifies the binding to a Role / ClusterRole
  kind: Role #this must be Role or ClusterRole
  name: pod-reader # this must match the name of the Role or ClusterRole you wish to bind to
  apiGroup: rbac.authorization.k8s.io


subjects:
- kind: User
  name: "alice@example.com"
  apiGroup: rbac.authorization.k8s.io
EOF
``` -->
