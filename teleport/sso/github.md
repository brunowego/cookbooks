# Teleport GitHub Single Sign-On Connector

<!--
https://goteleport.com/docs/deploy-a-cluster/helm-deployments/kubernetes-cluster/#step-33-sso-for-kubernetes
-->

## Docs

- [Creating an OAuth App](https://docs.github.com/en/developers/apps/building-oauth-apps/creating-an-oauth-app)

## Create OAuth App

1. GitHub -> Your organization profile -> Settings
2. Developer settings -> OAuth Apps -> New OAuth App
   - Application name: `Teleport`
   - Homepage URL: `https://<teleport-domain>/v1/webapi/github`
   - Authorization callback URL: `https://<teleport-domain>/v1/webapi/github/callback`
   - Check "Enable Device Flow"
   - Register application

## Configuration

```sh
#
tctl get cluster_auth_preference

#
export POD_NAME=$(kubectl get po -l app=teleport-cluster -o jsonpath='{.items[0].metadata.name}' -n teleport)
export GITHUB_CLIENT_ID='<client-id>'
export GITHUB_CLIENT_SECRET='<client-secret>'
export GITHUB_ORG_NAME='<org-name>'
export TELEPORT_DOMAIN='<teleport-domain>'

#
cat << EOF | kubectl exec \
  -i "$POD_NAME" \
  -n teleport \
    -- tctl create -f
---
kind: github
version: v3
metadata:
  name: github
spec:
  client_id: $GITHUB_CLIENT_ID
  client_secret: $GITHUB_CLIENT_SECRET
  display: GitHub
  redirect_url: https://$TELEPORT_DOMAIN/v1/webapi/github/callback
  teams_to_roles:
    - organization: $GITHUB_ORG_NAME
      team: admin
      roles:
        - access
EOF

#
tctl get cap

#
tsh logout

#
tsh \
  --proxy "teleport.${DOMAIN}:443" \
  --auth github \
  login
```
