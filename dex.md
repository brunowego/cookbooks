# Dex IdP

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

- [Code Repository](https://github.com/dexidp/dex)
- [Main Website](https://dexidp.io)

## Guides

- [Configuring the Dex Identity Provider](https://tanzu.vmware.com/developer/guides/kubernetes/identity-dex/)

## Content

- [Keycloak vs Dex](https://medium.com/@sct10876/keycloak-vs-dex-71f7fab29919)
- [Why not REST or gRPC Gateway?](https://dexidp.io/docs/api/#why-not-rest-or-grpc-gateway)

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
- email: 'admin@domain.tld'
  hash: '$2y$12$qX2CkazdjkulycmgtNCqUuO.amWBC.FY8w85YeAlD/ywzXOAog2SO'
  username: 'admin'
  userID: '168855e4-cc6d-11eb-b8bc-0242ac130003'
- email: 'johndoe@domain.tld'
  hash: '$2y$12$5NwpL8iCI0IUuDBl94UEteTxQ7V0uJlkMILuHlWacSapgyrsrTZBm'
  username: 'johndoe'
  userID: '5785145e-cc49-413f-a867-a18870c96882'
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
  docker.io/dexidp/dex:v2.35.0 dex serve /etc/dex/cfg/config.yml
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
  -d 'username=admin@domain.tld' \
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
