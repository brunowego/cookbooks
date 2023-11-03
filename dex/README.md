# Dex IdP

OpenID Connect (OIDC) identity and OAuth 2.0 provider with pluggable connectors.

**Keywords:** Identity Provider (IdP)

## Links

- [Code Repository](https://github.com/dexidp/dex)
- [Main Website](https://dexidp.io)

## Guides

- [Configuring the Dex Identity Provider](https://tanzu.vmware.com/developer/guides/kubernetes/identity-dex/)
- [Kubernetes authentication via GitHub OAuth and Dex](https://medium.com/preply-engineering/k8s-auth-a81f59d4dff6)

## Content

- [Keycloak vs Dex](https://medium.com/@sct10876/keycloak-vs-dex-71f7fab29919)
- [Why not REST or gRPC Gateway?](https://dexidp.io/docs/api/#why-not-rest-or-grpc-gateway)

## CLI

### Installation

```sh
# Unix-like
( git clone https://github.com/dexidp/dex.git /tmp/dex; cd "$_"; make build; cp ./bin/dex /usr/local/bin/dex; rm -fR /tmp/dex )
```

### Commands

```sh
dex -h
```

<!-- ### Configuration

```sh
cat << EOF > ./config.yml

EOF
``` -->

### Usage

```sh
#
dex serve ./config.yml
```

### Issues

#### Missing SQLite Directory

```log
failed to initialize storage: failed to perform migrations: creating migration table: unable to open database file: no such file or directory
```

Just create the path where will store the SQLite database.

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

For OIDC Client [select one here](#oidc-clients).

```sh
#
export OIDC_CLIENT_ID='openidconnect'
export OIDC_CLIENT_REDIRECT_URI='https://openidconnect.net/callback'
export OIDC_CLIENT_NAME='OpenID Connect Playground'
export OIDC_CLIENT_SECRET='OTFhZjUxOGVlMmJkMzcxYzA1'

#
export USER_EMAIL='admin@xyz.tld'
export USER_HASH="$(bcrypt-tool hash 'Pa$$w0rd!')"
export USER_NAME='admin'
export USER_ID='168855e4-cc6d-11eb-b8bc-0242ac130003' # UUID

#
docker run -i --rm \
  -v dex-config:/etc/dex/cfg \
  docker.io/library/alpine:3.9 /bin/sh << EOSHELL
mkdir -p /etc/dex/cfg

cat << \EOF > /etc/dex/cfg/config.yml
---
issuer: http://0.0.0.0:5556

storage:
  type: sqlite3
  config:
    file: /var/dex/dex.db

web:
  http: 0.0.0.0:5556

connectors: []

oauth2:
  responseTypes:
    - code
    - token
    - id_token
  skipApprovalScreen: true
  alwaysShowLoginScreen: false
  passwordConnector: local

staticClients:
  - id: $OIDC_CLIENT_ID
    redirectURIs:
      - $OIDC_CLIENT_REDIRECT_URI
    name: $OIDC_CLIENT_NAME
    secret: $OIDC_CLIENT_SECRET

enablePasswordDB: true

staticPasswords:
  - email: $USER_EMAIL
    hash: $USER_HASH
    username: $USER_NAME
    userID: $USER_ID
EOF
EOSHELL

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h dex \
  -v dex-data:/data \
  -v dex-config:/etc/dex/cfg \
  -p 5556:5556 \
  --name dex \
  --network workbench \
  docker.io/dexidp/dex:v2.35.3 dex serve /etc/dex/cfg/config.yml
```

### Testing

- [Using cURL](#curl-testing)
- [Using Debugger](/oidc.md#debugger)

### Remove

```sh
docker rm -f dex

docker volume rm dex-data dex-config
```

## Helm

### Dependencies

- [bcrypt-tool](/bcrypt-tool.md)
- [Cert Manager (cert-manager)](/cert-manager/README.md#helm)

### References

- [Values](https://github.com/dexidp/helm-charts/tree/master/charts/dex#values)

### Repository

```sh
helm repo add dex 'https://charts.dexidp.io'
helm repo update
```

### Install

```sh
#
kubectl create ns dex
# kubectl create ns auth

#
kubens dex

#
helm search repo -l dex/dex

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"
```

For OIDC Client [select one here](#oidc-clients).

```sh
#
export OIDC_CLIENT_ID='openidconnect'
export OIDC_CLIENT_REDIRECT_URI='https://openidconnect.net/callback'
export OIDC_CLIENT_NAME='OpenID Connect Playground'
export OIDC_CLIENT_SECRET='OTFhZjUxOGVlMmJkMzcxYzA1'

#
export USER_EMAIL='admin@xyz.tld'
export USER_HASH="$(bcrypt-tool hash 'Pa$$w0rd!')"
export USER_NAME='admin'
export USER_ID='168855e4-cc6d-11eb-b8bc-0242ac130003' # UUID

#
helm install dex dex/dex \
  --version 0.13.0 \
  -f <(cat << EOF
---
config:
  issuer: https://auth.${K8S_DOMAIN}

  storage:
    type: sqlite3
    config:
      file: /var/dex/dex.db

  web:
    http: 0.0.0.0:5556

  connectors: []

  oauth2:
    responseTypes:
     - code
     - token
     - id_token
    skipApprovalScreen: true
    alwaysShowLoginScreen: false
    passwordConnector: local

  staticClients:
    - id: $OIDC_CLIENT_ID
      redirectURIs:
        - $OIDC_CLIENT_REDIRECT_URI
      name: $OIDC_CLIENT_NAME
      secret: $OIDC_CLIENT_SECRET

  enablePasswordDB: true

  staticPasswords:
    - email: $USER_EMAIL
      hash: $USER_HASH
      username: $USER_NAME
      userID: $USER_ID

ingress:
  enabled: true
  className: nginx
  hosts:
    - host: auth.${K8S_DOMAIN}
      paths:
        - path: /
          pathType: Prefix
  tls:
    - secretName: dex.tls-secret
      hosts:
        - auth.${K8S_DOMAIN}
EOF
)
```

### Status

```sh
kubectl rollout status deploy/dex
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=dex' \
  -f
```

### Testing

- [Using cURL](#curl-testing)
- [Using Debugger](/oidc.md#debugger)

### Delete

```sh
helm uninstall dex

kubectl delete ns dex \
  --grace-period=0 \
  --force
```

## Tips

### OIDC Clients

| Name                                                    | ID              | Redirect URI                         | Secret (Base64)            |
| ------------------------------------------------------- | --------------- | ------------------------------------ | -------------------------- |
| [OpenID Connect Playground](https://openidconnect.net/) | `openidconnect` | `https://openidconnect.net/callback` | `OTFhZjUxOGVlMmJkMzcxYzA1` |
| [OpenID Connect debugger](https://oidcdebugger.com/)    | `oidcdebugger`  | `https://oidcdebugger.com/debug`     | `NGIxMmJmMTAxODc1N2FiZWY3` |
| [Postman](https://postman.com/)                         | `postman`       | `https://oauth.pstmn.io/v1/callback` | `Y2Y3MDkyMDZmMTdiYzI3OGZl` |

### Connectors

#### Google

1. [APIs & Services / Credentials](https://console.cloud.google.com/apis/credentials)
2. Create Credentials / OAuth client ID
3. Application type: Web application
   - Name: `Dex`
   - Authorized JavaScript origins: `https://auth.${K8S_DOMAIN}`
   - Authorized redirect URIs: `https://auth.${K8S_DOMAIN}/callback`
   - Create

### cURL Testing

```sh
# Using Docker
export DEX_URL='http://localhost:5556'
# Using Kubernetes
export DEX_URL="http://auth.${K8S_DOMAIN}"

#
curl -i "${DEX_URL}/healthz"

#
curl -s "${DEX_URL}/.well-known/openid-configuration" | jq
curl -s "${DEX_URL}/.well-known/openid-configuration" | jq '.authorization_endpoint'
curl -s "${DEX_URL}/.well-known/openid-configuration" | jq '.token_endpoint'
curl -s "${DEX_URL}/.well-known/openid-configuration" | jq '.jwks_uri'

#
export DEX_ACCESS_TOKEN=$(curl -s \
  -d 'grant_type=password' \
  -d 'username=admin@xyz.tld' \
  -d 'password=password' \
  -d 'scope=openid' \
  -d 'client_id=postman' \
  -d 'client_secret=ZXhhbXBsZS1hcHAtc2VjcmV0' \
  -X POST \
  "${DEX_URL}/token" | \
    jq -r '.id_token' \
)

#
curl \
  -s \
  -H "Authorization: Bearer ${DEX_ACCESS_TOKEN}" \
  '${DEX_URL}/userinfo' | \
    jq .

#
echo -e '[INFO]\t${DEX_URL}/auth?scope=openid&response_type=code&client_id=postman&redirect_uri=https://oauth.pstmn.io/v1/callback'

#
curl \
  -s \
  -H "Authorization: Bearer ${DEX_ACCESS_TOKEN}" \
  '${DEX_URL}/userinfo' | \
    jq .
```

## Issues

### Missing IPv6 Support

```log
connect ECONNREFUSED ::1:5556
```

```sh
#
telnet ::1 5556

#
lsof -nP -iTCP:'5556' | grep LISTEN
```

<!--
Colima not have IPv6 support.
-->

### TBD

```log
Internal Server Error
Login error.
```

TODO

### TBD

```log
Access blocked: Authorization Error

You can't sign in to this app because it doesn't comply with Google's OAuth 2.0 policy for keeping apps secure.
```

First, click on `error details`.
