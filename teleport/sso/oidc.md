# Teleport OpenID Connect Single Sign-On Connector

## Create OAuth App

TODO

## Configuration

TODO

<!--
kind: oidc
version: v2
metadata:
  name: new_oidc_connector
spec:
  redirect_url: "https://<cluster-url>/v1/webapi/oidc/callback"
  client_id: <client id>
  # connector display name that will be appended to the title of "Login with"
  # button on the cluster login screen so it will say "Login with Google".
  # Teleport will provide custom CSS for 'Google'.
  display: Google
  client_secret: <client secret>
  issuer_url: https://<issuer-url>
  scope: [<scope value>]
  claims_to_roles:
    - {claim: "hd", value: "domain.tld", roles: ["editor"]}
-->