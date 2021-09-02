# kcadm

## Kubectl

```sh
#
kubectl create secret generic keycloak-secrets --from-env-file=./.env

#
kubectl run -it --rm \
  --image docker.io/jboss/keycloak:13.0.1 \
  --overrides '{
  "spec": {
    "containers": [{
      "name": "keycloak",
      "image": "docker.io/jboss/keycloak:13.0.1",
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
```

## Docker

### Running

```sh
#
docker run -it --rm \
  -h keycloak \
  --env-file ./.env \
  --entrypoint /bin/bash \
  -w /opt/jboss/keycloak/bin \
  --name keycloak \
  docker.io/jboss/keycloak:13.0.1
```

## CLI

### Commands

```sh
./kcadm.sh help

./kcadm.sh create components --help
```

### Usage

```sh
export KEYCLOAK_SERVER='http://127.0.0.1:8080/auth'
export KEYCLOAK_REALM='master'
export KEYCLOAK_CLIENT_ID='admin-cli'
export KEYCLOAK_USER='admin'
export KEYCLOAK_PASSWORD='admin'

#
./kcadm.sh config credentials \
  --server "$KEYCLOAK_SERVER" \
  --realm "$KEYCLOAK_REALM" \
  --client "$KEYCLOAK_CLIENT_ID" \
  --user "$KEYCLOAK_USER" \
  --password "$KEYCLOAK_PASSWORD"

#
cat ~/.keycloak/kcadm.config

#
./kcadm.sh create realms \
  -s realm=test \
  -s enabled=true

#
./kcadm.sh create users \
  -r test \
  -s username=admin \
  -s enabled=true

#
./kcadm.sh set-password \
  -r test \
  --username admin \
  --new-password admin

#
./kcadm.sh create clients \
  -r test \
  -s clientId=test \
  -s directAccessGrantsEnabled=true \
  -s publicClient=true \
  -s 'webOrigins=["*"]' \
  -s 'redirectUris=["*"]'

#
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

#
./kcadm.sh delete realms/test
```
