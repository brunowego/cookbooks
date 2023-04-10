# Google Connector

## Configuration

```sh
#
export GOOGLE_CLIENT_ID='<google-client-id>'
export GOOGLE_CLIENT_SECRET='<google-client-secret>'
export GOOGLE_HOSTED_DOMAIN='<google-hosted-domain>'
```

```yml
---
# ...
connectors:
  - type: google
    id: google
    name: Google
    config:
      clientID: $GOOGLE_CLIENT_ID
      clientSecret: $GOOGLE_CLIENT_SECRET
      redirectURI: https://auth.${DOMAIN}/callback
      hostedDomains:
        - $GOOGLE_HOSTED_DOMAIN
```
