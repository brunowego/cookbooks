# kcadm

## Links

- [Code Repository](https://github.com/keycloak/keycloak/tree/main/integration/client-cli/admin-cli)

## Docs

- [Admin CLI](https://github.com/keycloak/keycloak-documentation/blob/main/server_admin/topics/admin-cli.adoc)

<!-- ## Kubectl

```sh
#
kubectl create secret generic keycloak-secrets \
  --from-env-file=./.env

#
kubectl run -it --rm \
  --image quay.io/keycloak/keycloak:20.0.2 \
  --overrides '{
  "spec": {
    "containers": [{
      "name": "keycloak",
      "image": "quay.io/keycloak/keycloak:20.0.2",
      "command": ["/bin/bash"],
      "workingDir": "/opt/jboss/keycloak/bin",
      "resources": {
        "limits": {
          "cpu": "2",
          "memory": "2Gi"
        },
        "requests": {
          "cpu": "2",
          "memory": "2Gi"
        }
      },
      "stdin": true,
      "tty": true,
      "envFrom": [{
        "secretRef": {
          "name": "keycloak-secrets"
        }
      }]
    }]
  }
}' \
  keycloak
``` -->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kcadm \
  -e KEYCLOAK_SERVER='http://127.0.0.1:8080/auth' \
  -e KEYCLOAK_REALM='master' \
  -e KEYCLOAK_CLIENT_ID='admin-cli' \
  -e KEYCLOAK_USER='admin' \
  -e KEYCLOAK_PASSWORD='Pa$$w0rd!' \
  --entrypoint /opt/jboss/keycloak/bin/kcadm.sh \
  --name kcadm \
  --network workbench \
  quay.io/keycloak/keycloak:20.0.2 help
```

## CLI

### Installation

#### Darwin

```sh
#
sudo install -dm 755 -o "$USER" -g staff /usr/local/opt/keycloak

curl \
  -L \
  'https://github.com/keycloak/keycloak/releases/download/20.0.2/keycloak-20.0.2.tar.gz' | \
    tar -xzC /usr/local/opt/keycloak --strip-components 1
```

### Commands

```sh
./kcadm.sh help
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Keycloak
export PATH="/usr/local/opt/keycloak/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Configuration

```sh
#
cat << EOF >> ./.env
KEYCLOAK_SERVER=http://127.0.0.1:8080/auth
KEYCLOAK_MASTER_REALM=master
KEYCLOAK_MASTER_CLIENT_ID=admin-cli
KEYCLOAK_USER=admin
KEYCLOAK_PASSWORD=Pa\$\$w0rd!
KEYCLOAK_ORG_REALM
EOF

direnv allow ./

#
kcadm.sh config credentials \
  --server "$KEYCLOAK_SERVER" \
  --realm "$KEYCLOAK_MASTER_REALM" \
  --client "$KEYCLOAK_MASTER_CLIENT_ID" \
  --user "$KEYCLOAK_USER" \
  --password "$KEYCLOAK_PASSWORD"

#
cat ~/.keycloak/kcadm.config

#
cat << EOF >> ./.env
KEYCLOAK_REALM=<org-name>
KEYCLOAK_CLIENT_ID=<software-name>
EOF

direnv allow ./

#
kcadm.sh create realms \
  -s realm="$KEYCLOAK_REALM" \
  -s displayName='<OrgName>' \
  -s enabled=true

#
kcadm.sh create clients \
  -r "$KEYCLOAK_REALM" \
  -s clientId="$KEYCLOAK_CLIENT_ID" \
  -s directAccessGrantsEnabled=true \
  -s publicClient=true \
  -s 'webOrigins=["*"]' \
  -s 'redirectUris=["*"]'

#
kcadm.sh create users \
  -r "$KEYCLOAK_REALM" \
  -s username='johndoe' \
  -s email='johndoe@xyz.tld' \
  -s firstName='John' \
  -s lastName='Doe' \
  -s enabled=true

#
kcadm.sh set-password \
  -r "$KEYCLOAK_REALM" \
  --username 'johndoe' \
  --new-password 'Pa$$w0rd!'
```

<!--
./kcadm.sh create components \
 -r test \
 -s name=uid-attribute-to-email-mapper \
 -s providerId=user-attribute-ldap-mapper \
 -s providerType=org.keycloak.storage.ldap.mappers.LDAPStorageMapper \
 -s parentId=johndoe \
 -s 'config."user.model.attribute"=["email"]' \
 -s 'config."ldap.attribute"=["uid"]' \
 -s 'config."read.only"=["false"]' \
 -s 'config."always.read.value.from.ldap"=["false"]' \
 -s 'config."is.mandatory.in.ldap"=["false"]'

./kcadm.sh delete realms/test
-->

### Testing

**Dependencies:**

- [cURL](/curl.md)
- [jless](/jless.md)
- [step](/step.md)
- [jq](/jq.md)

```sh
#
curl -s "http://localhost:8080/auth/realms/$KEYCLOAK_REALM" | jless

# OpenID Endpoint Configuration
curl -s "http://localhost:8080/auth/realms/$KEYCLOAK_REALM/.well-known/openid-configuration" | jless

# SAML 2.0 Identity Provider Metadata
curl -s "http://127.0.0.1:8080/auth/realms/$KEYCLOAK_REALM/protocol/saml/descriptor"

# Authorization
echo -e "[INFO]\thttp://localhost:8080/auth/realms/$KEYCLOAK_REALM/protocol/openid-connect/auth?scope=openid&response_type=code&client_id=$KEYCLOAK_CLIENT_ID&redirect_uri=https://oauth.pstmn.io/v1/callback"

# User Info
export KEYCLOAK_ACCESS_TOKEN=$(curl -s \
  -d 'grant_type=password' \
  -d 'username=johndoe' \
  -d 'password=Pa$$w0rd!' \
  -d "client_id=$KEYCLOAK_CLIENT_ID" \
  -X POST \
  "http://localhost:8080/auth/realms/$KEYCLOAK_REALM/protocol/openid-connect/token" | \
    jq -r '.access_token' \
); echo "$KEYCLOAK_ACCESS_TOKEN" | step crypto jwt inspect --insecure

curl \
  -s \
  -H "Authorization: Bearer ${KEYCLOAK_ACCESS_TOKEN}" \
  "http://localhost:8080/auth/realms/$KEYCLOAK_REALM/protocol/openid-connect/userinfo" | jless

# End Session
# http://localhost:8080/auth/realms/$KEYCLOAK_REALM/protocol/openid-connect/logout

# JSON Web Key Set (JWKS) URI
curl -s "http://localhost:8080/auth/realms/$KEYCLOAK_REALM/protocol/openid-connect/certs" | jless
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

### Tips

#### SMTP Configuration

1. Realm Settings
2. Email Tab

```sh
#
export SMTP_HOST=''
export SMTP_PORT='587'
export SMTP_EMAIL_FROM=''
export SMTP_USER=''
export SMTP_PASS=''

#
./kcadm.sh update realms/test \
  -x \
  -s 'smtpServer.host=${SMTP_HOST}' \
  -s 'smtpServer.port=${SMTP_PORT}' \
  -s 'smtpServer.from=${SMTP_EMAIL_FROM}' \
  -s 'smtpServer.auth=true' \
  -s 'smtpServer.ssl=false' \
  -s 'smtpServer.user=${SMTP_USER}' \
  -s 'smtpServer.password=${SMTP_PASS}'
```
