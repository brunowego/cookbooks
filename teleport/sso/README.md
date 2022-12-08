# Teleport Single Sign-On (SSO)

## Docs

- [SSO for Kubernetes](https://goteleport.com/docs/deploy-a-cluster/helm-deployments/kubernetes-cluster/#step-33-sso-for-kubernetes)

## Glossary

- OpenID Connect (OIDC)

## Roles

```sh
#
cat << EOF | tctl create -f
kind: role
version: v5
metadata:
  name: interns
spec:
  allow:
    logins: ['readonly']
    kubernetes_groups: ["view"]
    node_labels:
      'env': ['staging', 'test']
    kubernetes_labels:
      'env': 'dev'
    app_labels:
      'type': ['monitoring']
  deny:
    node_labels:
      'env': 'prod'
    kubernetes_labels:
      'env': 'prod'
    db_labels:
      'env': 'prod'
    app_labels:
      'env': 'prod'
EOF

#
tctl get roles --format text
```
