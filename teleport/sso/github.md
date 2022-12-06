# Teleport GitHub Single Sign-On Connector

<!--
https://goteleport.com/docs/deploy-a-cluster/helm-deployments/kubernetes-cluster/#step-33-sso-for-kubernetes
-->

## Configuration

```sh
#
export POD_NAME=$(kubectl get po -l app=teleport-cluster -o jsonpath='{.items[0].metadata.name}' -n teleport-system)

#
cat << EOF | kubectl exec -i "$POD_NAME" -n teleport-system -- tctl create -f
---
kind: github
version: v3
metadata:
  name: github
spec:
  client_id: client-id
  client_secret: client-secret
  display: GitHub
  redirect_url: https://tele.example.com:443/v1/webapi/github/callback
  teams_to_roles:
    - organization: octocats
      team: admin
      roles: ["access"]
EOF

#
tsh --auth=github login
```
