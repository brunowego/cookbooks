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
curl -s 'http://localhost:5556/.well-known/openid-configuration' | jq

#
curl -s 'http://localhost:5556/keys' | jq

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

## Helm

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

#
helm install dex dex/dex \
  --version 0.13.0 \
  -f <(cat << EOF
config:
  issuer: http://0.0.0.0:5556

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
      hash: '\$2y\$12\$qX2CkazdjkulycmgtNCqUuO.amWBC.FY8w85YeAlD/ywzXOAog2SO'
      username: 'admin'
      userID: '168855e4-cc6d-11eb-b8bc-0242ac130003'
    - email: 'johndoe@domain.tld'
      hash: '\$2y\$12\$5NwpL8iCI0IUuDBl94UEteTxQ7V0uJlkMILuHlWacSapgyrsrTZBm'
      username: 'johndoe'
      userID: '5785145e-cc49-413f-a867-a18870c96882'

ingress:
  enabled: true
  className: nginx
  hosts:
    - host: auth.${DOMAIN}
      paths:
        - path: /
          pathType: Prefix
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

```sh
#
curl -i "http://auth.${DOMAIN}/healthz"

#
curl -s "http://auth.${DOMAIN}/.well-known/openid-configuration" | jq

#
curl -s "http://auth.${DOMAIN}/keys" | jq

#
export DEX_ACCESS_TOKEN=$(curl -s \
  -d 'grant_type=password' \
  -d 'username=admin@domain.tld' \
  -d 'password=password' \
  -d 'scope=openid' \
  -d 'client_id=postman' \
  -d 'client_secret=ZXhhbXBsZS1hcHAtc2VjcmV0' \
  -X POST \
  "http://auth.${DOMAIN}/token" | \
    jq -r '.id_token' \
)

#
curl \
  -s \
  -H "Authorization: Bearer ${DEX_ACCESS_TOKEN}" \
  'http://auth.${DOMAIN}/userinfo' | \
    jq .

#
echo -e '[INFO]\thttp://auth.${DOMAIN}/auth?scope=openid&response_type=code&client_id=postman&redirect_uri=https://oauth.pstmn.io/v1/callback'

#
curl \
  -s \
  -H "Authorization: Bearer ${DEX_ACCESS_TOKEN}" \
  'http://auth.${DOMAIN}/userinfo' | \
    jq .
```

### Delete

```sh
helm uninstall dex

kubectl delete ns dex \
  --grace-period=0 \
  --force
```
