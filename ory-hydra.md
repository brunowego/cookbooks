# Ory Hydra

<!--
https://www.youtube.com/watch?v=996OiexHze0&feature=emb_title
https://medium.com/@eileen.code4fun/use-the-source-ory-hydra-bd5c460a2f37
https://github.com/ory/hydra
https://www.ory.sh/docs/next/hydra/5min-tutorial

https://github.com/kyma-project/kyma/blob/main/tests/perf/components/ory/ory.js
-->

**Keywords:** Identity Provider (IdP)

## Guides

- [REST API](https://www.ory.sh/hydra/docs/reference/api/)

## References

- [5 Minute Tutorial](https://www.ory.sh/hydra/docs/5min-tutorial/)

## Tools

- [OpenID Connect <debugger/>](https://oidcdebugger.com/)
- [JSON Web Token - Encode or Decode JWTs](https://jsonwebtoken.io/)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgresql \
  -e POSTGRES_USER='hydra' \
  -e POSTGRES_PASSWORD='hydra' \
  -e POSTGRES_DB='hydra' \
  -v hydra-postgresql-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name hydra-postgresql \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -i --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h migrate \
  --name hydra-migrate \
  --network workbench \
  docker.io/oryd/hydra:v1.10-alpine migrate sql \
    --yes \
    'postgres://hydra:hydra@hydra-postgresql:5432/hydra?sslmode=disable'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h hydra \
  -e DSN='postgres://hydra:hydra@hydra-postgresql:5432/hydra?sslmode=disable' \
  -e SECRETS_SYSTEM='insecure-secret0' \
  -e URLS_CONSENT='http://localhost:3000/consent'\
  -e URLS_LOGIN='http://localhost:3000/login' \
  -e URLS_SELF_ISSUER='https://localhost:4444' \
  -e FORCE_ROOT_CLIENT_CREDENTIALS='admin:password' \
  -p 4444:4444 \
  -p 4445:4445 \
  --name hydra \
  --network workbench \
  docker.io/oryd/hydra:v1.10-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h oauth-example \
  -e HYDRA_ADMIN_URL='https://hydra:4445' \
  -e NODE_TLS_REJECT_UNAUTHORIZED='0' \
  -p 3000:3000 \
  --name hydra-oauth-example \
  --network workbench \
  docker.io/oryd/hydra-login-consent-node:v1.10.2
```

###

```sh
#
hydra clients list \
  --endpoint 'https://localhost:4445' \
  --skip-tls-verify

#
hydra clients create \
  --endpoint 'https://localhost:4445' \
  --skip-tls-verify \
  --id 'postman' \
  --secret 'ZXhhbXBsZS1hcHAtc2VjcmV0' \
  --grant-types 'password,authorization_code,refresh_token,client_credentials,implicit' \
  --response-types 'token,code,id_token' \
  --scope 'openid,offline' \
  --callbacks 'https://oauth.pstmn.io/v1/callback'
```

```sh
#
curl -ik 'https://localhost:4444/health/ready'
curl -ik 'https://localhost:4445/health/ready'

#
curl -sk 'https://localhost:4444/.well-known/openid-configuration' | python -m json.tool

#
curl -sk 'https://localhost:4444/.well-known/jwks.json' | python -m json.tool

#
hydra token user \
  --endpoint 'https://localhost:4445' \
  --skip-tls-verify \
  --auth-url 'https://localhost:4444/oauth2/auth' \
  --token-url 'https://localhost:4444/oauth2/token' \
  --client-id 'postman' \
  --client-secret 'ZXhhbXBsZS1hcHAtc2VjcmV0' \
  --scope 'openid,offline' \
  --redirect 'https://oauth.pstmn.io/v1/callback'
```

<!-- #
export ORY_HYDRA_ACCESS_TOKEN=$(curl -sk \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -u 'admin:password' \
  -d 'grant_type=client_credentials' \
  -d 'scope=hydra' \
  -d 'client_id=postman' \
  -d 'client_secret=ZXhhbXBsZS1hcHAtc2VjcmV0' \
  -X POST \
  'https://localhost:4444/oauth2/token' | \
    jq -r '.access_token' \
)

#
curl \
  -s \
  -H "Authorization: Bearer ${ORY_HYDRA_ACCESS_TOKEN}" \
  'https://localhost:4444/userinfo' | \
    jq . -->

### Remove

```sh
docker rm -f hydra-postgresql hydra hydra-oauth-example

docker volume rm hydra-postgresql-data
```

## CLI

### Installation

#### Homebrew

```sh
brew install ory-hydra
```

#### Linux

```sh
bash <(curl https://raw.githubusercontent.com/ory/hydra/master/install.sh) -b ./ 1.4.8
sudo mv ./hydra /usr/local/bin
```

### Commands

```sh
hydra -h
```

### Usage

```sh
#
hydra serve all \
  --config ./config.yaml

#
hydra clients list \
  --endpoint [endpoint] \
  --skip-tls-verify

#
hydra clients create \
  --endpoint http://localhost:9001 \
  -g client_credentials \
  --id test \
  --secret testsecret \
  --skip-tls-verify
```

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  --name hydra \
  docker.io/oryd/hydra:v1.8.5 help
```
