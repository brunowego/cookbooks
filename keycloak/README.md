# Keycloak

**Keywords:** Identity Provider (IdP), Access Management

<!--
https://github.com/aws-samples/keycloak-on-aws
https://www.amazonaws.cn/en/solutions/keycloak-on-aws/
https://github.com/devopsutils/keycloak-cluster-aws-rds

https://blog.sighup.io/keycloak-ha-on-kubernetes/
https://github.com/sighupio/fury-kubernetes-keycloak#considerations-for-keycloak-4.8.2.final

https://idp.miniorange.com/login-using-keycloak/

https://blog.sighup.io/keycloak-ha-on-kubernetes/

https://blog.ippon.tech/feedback-keycloak-high-availability-in-cloud-environment-aws-part-3-4/

https://github.com/asatrya/keycloak-traefik-tutorial
https://github.com/gyrospectre/traefikrp
https://github.com/ibuetler/docker-keycloak-traefik-workshop
https://gist.github.com/kurt---/7f5415d268f815067252d582044bc99d
https://github.com/jcperezamin/jcperezamin.github.io/tree/master/16_SSO_with_Keycloak

https://github.com/keycloak/keycloak-operator

https://codergists.com/redhat/keycloak/security/authentication/2020/01/07/getting-started-with-keycloak-on-rhel8.html

https://www.cloud-iam.com/#pricing

https://github.com/Mu-Wahba/keycloak-for-production

https://github.com/akvo/akvo-lumen/commit/2a15a7eedd3d8fd9e77ba7b1eb4cee4ccf168b71
-->

## Links

- [Code Repository](https://github.com/keycloak/keycloak)
- [Awesome Keycloak](https://github.com/thomasdarimont/awesome-keycloak)

## Alternatives

<!-- (Identity Provider (IdP)) -->

- [Auth0](https://auth0.com/)
- [AWS Cognito](/aws/aws-cognito.md)
- [Azure AD](https://azure.microsoft.com/en-us/services/active-directory/)
- [Gluu](https://gluu.org/)
- [Okta](https://okta.com/)
- [ORY Hydra](ory-hydra.md)

## Guides

- [Getting Started Guide](https://www.keycloak.org/docs/latest/getting_started/)
- [How to size your projects for Red Hat's single sign-on technology](https://developers.redhat.com/articles/2021/06/07/how-size-your-projects-red-hats-single-sign-technology#planning_the_performance_assessment)
- [The Admin CLI](https://github.com/keycloak/keycloak-documentation/blob/master/server_admin/topics/admin-cli.adoc)
- [Keycloak Performance Testsuite](https://github.com/keycloak/keycloak/tree/master/testsuite/performance)

## CLI Embedded Mode

```sh
#
[disconnected /] connect

#
[disconnected /] embed-server --server-config=standalone.xml --std-out=echo
```

```sh
#
(echo embed-server --server-config=standalone.xml --std-out=echo; cat myscript.cli) | jboss-cli.sh
```

<!--
jboss-cli.sh --file=turn-off-caching.cli
-->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

<!--
13.0.1
-->

#### Version 13.x

```sh
# Using MySQL
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='keycloak' \
  -e MYSQL_PASSWORD='keycloak' \
  -e MYSQL_DATABASE='keycloak' \
  -v keycloak-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name keycloak-mysql \
  --network workbench \
  docker.io/library/mysql:8.0 \
    --default-authentication-plugin=mysql_native_password

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h keycloak \
  -e DB_VENDOR='mysql' \
  -e DB_ADDR='keycloak-mysql' \
  -e DB_DATABASE='keycloak' \
  -e DB_USER='keycloak' \
  -e DB_PASSWORD='keycloak' \
  -e KEYCLOAK_USER='admin' \
  -e KEYCLOAK_PASSWORD='admin' \
  -p 8080:8080 \
  -p 8443:8443 \
  --name keycloak \
  --network workbench \
  docker.io/jboss/keycloak:12.0.4 \
    -Dkeycloak.profile.feature.upload_scripts=enabled
```

```sh
# Using PostgreSQL
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER='keycloak' \
  -e POSTGRES_PASSWORD='keycloak' \
  -e POSTGRES_DB='keycloak' \
  -v keycloak-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name keycloak-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h keycloak \
  -e DB_VENDOR='postgres' \
  -e DB_ADDR='keycloak-postgres' \
  -e DB_DATABASE='keycloak' \
  -e DB_SCHEMA='public' \
  -e DB_USER='keycloak' \
  -e DB_PASSWORD='keycloak' \
  -e KEYCLOAK_USER='admin' \
  -e KEYCLOAK_PASSWORD='admin' \
  -p 8080:8080 \
  -p 8443:8443 \
  --name keycloak \
  --network workbench \
  docker.io/jboss/keycloak:12.0.4 \
    -Dkeycloak.profile.feature.upload_scripts=enabled
```

> Wait! This process take a while.

```sh
#
echo -e '[INFO]\thttp://127.0.0.1:8080'

#
echo -e '[INFO]\thttp://127.0.0.1:8080/auth/admin/'
```

### Testing

```sh
#
curl -i 'http://localhost:8080/auth/realms/master'

# OpenID Endpoint Configuration
curl -s 'http://localhost:8080/auth/realms/master/.well-known/openid-configuration' | python -m json.tool

# SAML 2.0 Identity Provider Metadata
curl -s 'http://127.0.0.1:8080/auth/realms/master/protocol/saml/descriptor'

# Authorization
echo -e '[INFO]\thttp://localhost:8080/auth/realms/master/protocol/openid-connect/auth?scope=openid&response_type=code&client_id=demo&redirect_uri=https://oauth.pstmn.io/v1/callback'

# User Info
export KEYCLOAK_ACCESS_TOKEN=$(curl -s \
  -d 'grant_type=password' \
  -d 'username=admin' \
  -d 'password=admin' \
  -d 'client_id=demo' \
  -X POST \
  'http://localhost:8080/auth/realms/master/protocol/openid-connect/token' | \
    jq -r '.access_token' \
)

curl \
  -s \
  -H "Authorization: Bearer ${KEYCLOAK_ACCESS_TOKEN}" \
  'http://localhost:8080/auth/realms/master/protocol/openid-connect/userinfo' | \
    jq .

# End Session
# http://localhost:8080/auth/realms/master/protocol/openid-connect/logout

# JSON Web Key Set (JWKS) URI
curl -s 'http://localhost:8080/auth/realms/master/protocol/openid-connect/certs' | python -m json.tool
```

<!--
  location_header=$(curl -sS -D - "${KEYCLOAK_URL}/admin/realms/${REALM}/users" \
    -H 'Content-Type: application/json' \
    -H "Authorization: Bearer ${ADMIN_TOKEN}" \
    -d "{\"username\":\"user-${count}\", \"enabled\":\"true\"}" | grep -Fi 'Location:')

  user_id=$(echo "${location_header##*/}" | tr -d '\r')

  curl -sS -X PUT "${KEYCLOAK_URL}/admin/realms/${REALM}/users/${user_id}/reset-password" \
    -H 'Content-Type: application/json' \
    -H "Authorization: Bearer ${ADMIN_TOKEN}" \
    -d '{"type":"password", "value":"user", "temporary":false}'
-->

### JBoss Application Server (AS) CLI

```sh
docker exec -it keycloak /opt/jboss/keycloak/bin/jboss-cli.sh
```

### Remove

```sh
# Using MySQL
docker rm -f \
  keycloak-mysql \
  keycloak

docker volume rm \
  keycloak-mysql-data

# Using PostgreSQL
docker rm -f \
  keycloak-postgres \
  keycloak

docker volume rm \
  keycloak-postgres-data
```

### Tips

#### Token Exchange

```sh
export JAVA_OPTS_APPEND='-Dkeycloak.profile.feature.upload_scripts=enabled -Dkeycloak.profile.feature.admin_fine_grained_authz=enabled -Dkeycloak.profile.feature.token_exchange=enabled'
```

## Helm

### References

- [Configuration](https://github.com/codecentric/helm-charts/tree/master/charts/keycloak#configuration)

### Repository

```sh
helm repo add codecentric https://codecentric.github.io/helm-charts
helm repo update
```

### Install

```sh
kubectl create namespace keycloak
```

<!-- ```sh
#
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n keycloak

helm install keycloak codecentric/keycloak \
  --namespace keycloak \
  --version 11.0.1 \
  --set keycloak.username=admin \
  --set-string keycloak.ingress.enabled=true \
  --set keycloak.ingress.hosts={keycloak.example.com} \
  --set 'keycloak.ingress.tls[0].secretName=example.tls-secret' \
  --set 'keycloak.ingress.tls[0].hosts={keycloak.example.com}' \
  --set keycloak.persistence.deployPostgres=true \
  --set keycloak.persistence.dbVendor=postgres
``` -->

```sh
#
helm install keycloak codecentric/keycloak \
  --namespace keycloak \
  --version 11.0.1 \
  --set ingress.enabled=true \
  --set 'ingress.rules[0].host=keycloak.cluster.local' \
  --set 'ingress.rules[0].paths={/}'
```

### Status

```sh
kubectl rollout status statefulset/keycloak \
  -n keycloak
```

### Secret

```sh
kubectl get secret keycloak-http \
  -o jsonpath='{.data.password}' \
  -n keycloak | \
    base64 --decode; echo
```

### Configuration

```sh
#
sudo hostess add keycloak.cluster.local 127.0.0.1
```

### Delete

```sh
helm uninstall keycloak \
  -n keycloak

kubectl delete namespace keycloak \
  --grace-period=0 \
  --force
```

## Docs

### New Realm

1. Master -> Add realm
   - Name: myapp-local
   - Create
2. Configure -> Realm Settings
   - Display name: MyApp Local
   - Save

| Environment | Name |
| --- | --- |
| Local | `myapp-local` |
| Testing | `myapp-test` |
| Production | `myapp` |

### New Role

1. Configure -> Roles -> Add role
   - Role Name: admin
   - Save

**Next:** Do the same for `user` role.

### New User

1. Manage -> Users -> Add user
   - Username: johndoe
   - Email: johndoe@example.com
   - Email Verified: Check ON
   - Save
2. Credentials Tab -> Set Password Section
   - Temporary: Check OFF
   - Set Password
3. Role Mappings Tab -> Realm Roles Section
   - Available Roles -> Choose `admin` and `user` -> Add selected

### Add Clients (Services)

#### Backend

1. Configure -> Clients -> Create
   - Client ID: backend
   - Save
2. Configure -> Clients -> Actions Edit "backend"
   - Access Type: bearer-only
   - Save

#### Frontend

1. Configure -> Clients -> Create
   - Client ID: frontend
   - Save
2. Configure -> Clients -> Actions Edit "frontend"
   - Valid Redirect URIs: *
   - Web Origins *
   - Save
3. Configure -> Clients -> Actions Edit "frontend"
   - Mappers Tab -> Add Builtin -> Search "realm roles" -> Check Add -> Add selected
   - Mappers Tab -> Actions Edit "realm roles"
     - Token Claim Name: groups
     - Save
