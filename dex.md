# dex

OpenID Connect (OIDC) identity and OAuth 2.0 provider with pluggable connectors.

**Keywords:** Identity Provider (IdP)

<!--
dexctl

https://github.com/Kuadrant/authorino/tree/master/examples

kubectl get authrequests -n security | wc -l

https://medium.com/preply-engineering/k8s-auth-a81f59d4dff6

https://aws.amazon.com/blogs/containers/introducing-oidc-identity-provider-authentication-amazon-eks/
https://aws.amazon.com/blogs/containers/using-dex-dex-k8s-authenticator-to-authenticate-to-amazon-eks/
-->

## Links

- [Main Website](https://github.com/dexidp/dex)

## Guides

- [Configuring the Dex Identity Provider](https://tanzu.vmware.com/developer/guides/kubernetes/identity-dex/)

## Content

- [Keycloak vs Dex](https://medium.com/@sct10876/keycloak-vs-dex-71f7fab29919)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -i --rm \
  -v dex-config:/etc/dex/cfg \
  docker.io/library/alpine:3.9 /bin/sh << \EOSHELL
mkdir -p /etc/dex/cfg
cat << \EOF > /etc/dex/cfg/config.yml
issuer: http://localhost:5556

storage:
  type: sqlite3
  config:
    file: /var/dex/dex.db

web:
  http: 0.0.0.0:5556

connectors: []

oauth2:
  responseTypes: ['code', 'token', 'id_token']
  skipApprovalScreen: true
  alwaysShowLoginScreen: false
  passwordConnector: local

staticClients:
- id: postman
  redirectURIs:
  - 'https://oauth.pstmn.io/v1/callback'
  name: 'Postman'
  secret: ZXhhbXBsZS1hcHAtc2VjcmV0

enablePasswordDB: true

staticPasswords:
- email: 'admin@example.com'
  # bcrypt hash of the string 'password'
  hash: '$2a$10$2b2cU8CPhOTaGrs1HRQuAueS7JTT5ZHsHSzYiFPm1leZck7Mc8T4W'
  username: 'admin'
  userID: '08a8684b-db88-4b73-90a9-3cd1661f5466'
EOF
EOSHELL
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h dex \
  -v dex-data:/data \
  -v dex-config:/etc/dex/cfg \
  -p 5556:5556 \
  --name dex \
  --network workbench \
  docker.io/dexidp/dex:v2.28.1 dex serve /etc/dex/cfg/config.yml
```

### Testing

```sh
#
curl -i 'http://localhost:5556/healthz'

#
curl -s 'http://localhost:5556/.well-known/openid-configuration' | python -m json.tool

#
curl -s 'http://localhost:5556/keys' | python -m json.tool

#
export DEX_ACCESS_TOKEN=$(curl -s \
  -d 'grant_type=password' \
  -d 'username=admin@example.com' \
  -d 'password=password' \
  -d 'scope=openid' \
  -d 'client_id=postman' \
  -d 'client_secret=ZXhhbXBsZS1hcHAtc2VjcmV0' \
  -X POST \
  'http://localhost:5556/token' | \
    jq -r '.id_token' \
)

#
curl \
  -s \
  -H "Authorization: Bearer ${DEX_ACCESS_TOKEN}" \
  'http://localhost:5556/userinfo' | \
    jq .

#
echo -e '[INFO]\thttp://localhost:5556/auth?scope=openid&response_type=code&client_id=postman&redirect_uri=https://oauth.pstmn.io/v1/callback'

#
curl \
  -s \
  -H "Authorization: Bearer ${DEX_ACCESS_TOKEN}" \
  'http://localhost:5556/userinfo' | \
    jq .
```

### Remove

```sh
docker rm -f dex

docker volume rm dex-data dex-config
```
