# Keycloak

**Keywords:** Identity Provider (IdP), Access Management

<!--
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
-->

## Links

- [Code Repository](https://github.com/keycloak/keycloak)

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
  -h postgres \
  -e POSTGRES_USER='keycloak' \
  -e POSTGRES_PASSWORD='keycloak' \
  -e POSTGRES_DB='keycloak' \
  -v keycloak-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name keycloak-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h keycloak \
  -e DB_VENDOR='postgres' \
  -e DB_ADDR='keycloak-postgres' \
  -e DB_USER='keycloak' \
  -e DB_PASSWORD='keycloak' \
  -e DB_DATABASE='keycloak' \
  -e DB_SCHEMA='public' \
  -e KEYCLOAK_USER='admin' \
  -e KEYCLOAK_PASSWORD='admin' \
  -p 8080:8080 \
  -p 8443:8443 \
  --name keycloak \
  --network workbench \
  docker.io/jboss/keycloak:13.0.0 \
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

#
curl -s 'http://localhost:8080/auth/realms/master/protocol/openid-connect/certs' | python -m json.tool

#
export KEYCLOAK_ACCESS_TOKEN=$(curl -s \
  -d 'grant_type=password' \
  -d 'username=admin' \
  -d 'password=admin' \
  -d 'client_id=demo' \
  -X POST \
  'http://localhost:8080/auth/realms/master/protocol/openid-connect/token' | \
    jq -r '.access_token' \
)

#
curl \
  -s \
  -H "Authorization: Bearer ${KEYCLOAK_ACCESS_TOKEN}" \
  'http://localhost:8080/auth/realms/master/protocol/openid-connect/userinfo' | \
    jq .

#
echo -e '[INFO]\thttp://localhost:8080/auth/realms/master/protocol/openid-connect/auth?scope=openid&response_type=code&client_id=demo&redirect_uri=https://oauth.pstmn.io/v1/callback'
```

### Remove

```sh
docker rm -f keycloak-postgres keycloak

docker volume rm keycloak-postgres-data
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

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n keycloak
```

```sh
helm install keycloak codecentric/keycloak \
  --namespace keycloak \
  --set keycloak.username=admin \
  --set-string keycloak.ingress.enabled=true \
  --set keycloak.ingress.hosts={keycloak.example.com} \
  --set 'keycloak.ingress.tls[0].secretName=example.tls-secret' \
  --set 'keycloak.ingress.tls[0].hosts={keycloak.example.com}' \
  --set keycloak.persistence.deployPostgres=true \
  --set keycloak.persistence.dbVendor=postgres
```

### Status

```sh
kubectl rollout status statefulset/keycloak -n keycloak
```

### Secret

```sh
kubectl get secret keycloak-http \
  -o jsonpath='{.data.password}' \
  -n keycloak | \
    base64 --decode; echo
```

### Delete

```sh
helm uninstall keycloak -n keycloak
kubectl delete namespace keycloak --grace-period=0 --force
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
