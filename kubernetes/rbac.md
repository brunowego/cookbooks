# Kubernetes Role-Based Access Control (RBAC)

<!--
https://www.strongdm.com/blog/kubernetes-rbac-role-based-access-control
https://medium.com/containerum/configuring-permissions-in-kubernetes-with-rbac-a456a9717d5d
-->

## Guides

- [Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
- [Authorization Overview](https://kubernetes.io/docs/reference/access-authn-authz/authorization/#review-your-request-attributes)

## Solution

### Definitions

#### Roles

- Roles are what can be done to Resources
- Roles are made up of one or many Rules
- Verbs on resources: Get Pods, Create Deployment
- Default deny, add permissions to Resources
- There is no deny permission
- Roles are namespaced

#### Cluster Roles

- Similar to a Role, enables access to Resources
- Cluster scoped resources: Nodes, PersistentVolumes, etc.
- Give access across more than one namespace or all namespaces
- Defining Roles in each namespace can increase administrative overhead and can be error prone

#### Role Binding

- Role/ClusterRole only say what can be done
- Defines the Subjects and refers to a Role/ClusterRole
- Who can do what defined in a Role/ClusterRole
- Role and RoleBinding are user in namespaced scoped security
- ClusterRole and RoleBinding are used provide access to more than one namespace or the whole cluster

#### Cluster Role Binding

- ClusterRoleBinding grants access cluster-wide
- Combing a ClusterRole with a ClusterRoleBinding
- Will scope security independent of namespace
  - Non-namespaced
  - Cluster-scoped resources

### What to use when?

- Use Role and a RoleBinding to scope security to a single namespace
- Use ClusterROle and RoleBinding to scope security to several or all namespaces
- Use Cluster Role and ClusterRoleBinding to scope security to all namespaces OR cluster-scoped resources (Nodes, PersistentVolumes, etc.)

### Default ClusterRoles

- cluster-admin
  - Cluster-wide super user
  - RoleBinding - full admin within a Namespace
  - Edit Roles/RoleBindings Resource Quotas
- admin
  - Full access within a Namespace
  - RoleBinding - full admin within a Namespace
  - Edit Roles/RoleBindings
- edit
  - Read/write within a Namespace
  - NOT view/edit Roles/RoleBindings Resource Quotas
  - Access to Secrets
- view
  - Read-only within a Namespace
  - NOT view/edit Roles/RoleBindings Resource Quotas
  - No Access to Secrets

### Defining Roles and ClusterRoles

- Rules
  - apiGroups: An empty string designates the Core API group
  - Resources: Pods, Services, Deployments, Nodes and more
  - Verbs: get, list, create, update, patch, watch, delete, deletecollection
- Roles/ClusterRoles can have several Rules defined

### Defining RoleBindings and ClusterRoleBindings

- roleRef
  - kind
    - RoleBinding -> Role/ClusterRole
    - ClusterRoleBinding -> ClusterRole
  - name
- Subjects
  - kind (User/Group/ServiceAccount)
  - Name
  - Namespace

## CLI

### Usage

```sh
#
kubectl get roles
kubectl get clusterroles

#
kubectl get rolebindings
kubectl get clusterrolebindings

#
kubectl get serviceaccounts

#
kubectl get podsecuritypolicies
```

### Tips

#### Role Creation

<!--
kubectl \
  # ...
  --dry-run client \
  -o yaml
-->

```sh
#
kubectl create role [role-name] \
  --verb get,list \
  --resources pods
  --namespace [namespace]

#
kubectl create rolebinding [rb-name] \
  --role [role-name] \
  --user [username] \
  --namespace [namespace]

#
kubectl auth can-i list pods
kubectl auth can-i list pods --as [username]
kubectl auth can-i list pods --as [username] -n [namespace]
kubectl auth can-i list deployments --as [username] -n [namespace]
```

## Issues

### Forbidden

```log
error: error upgrading connection: pods "[pod-name]" is forbidden: User "[username]" cannot create resource "pods/portforward" in API group "" in the namespace "[namespace]"
```

TODO
