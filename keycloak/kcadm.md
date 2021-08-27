# kcadm

TODO

<!-- ./kcadm.sh create components --help -->

<!--
kcadm.sh delete realms/example

curl \
  --location \
  --request DELETE \
  'localhost:38080/auth/admin/realms/example' \
  --header 'Authorization: Bearer <TOKEN HERE>' \
  --header 'Content-Type: application/x-www-form-urlencoded'
-->

<!-- /opt/jboss/keycloak/bin/kcadm.sh config credentials --user admin --password admin --server http://$KEYCLOAK_INSTANCE:8080/auth --realm master
/opt/jboss/keycloak/bin/kcadm.sh create realms -s realm=DataLabs -s enabled=true
/opt/jboss/keycloak/bin/kcadm.sh create users -r DataLabs -s username=admin -s enabled=true
/opt/jboss/keycloak/bin/kcadm.sh set-password -r DataLabs --username admin --new-password admin
/opt/jboss/keycloak/bin/kcadm.sh create clients -r DataLabs -s clientId=datalabs -s 'webOrigins=["*"]' -s 'redirectUris=["*"]' -s '"implicitFlowEnabled"=1' -s '"publicClient"=1' -->

./kcadm.sh create clients \
  -r master \
  -s clientId=my-client \
  -s directAccessGrantsEnabled=true \
  -s publicClient=true \
  -s 'webOrigins=["*"]' \
  -s 'redirectUris=["*"]'

./kcadm.sh create users \
  -r master \
  -s username=johndoe \
  -s enabled=true \
  -s emailVerified=true \
  -s email=johndoe@example.com \
  -s firstName="John Doe"

./kcadm.sh set-password \
  -r master \
  --username johndoe \
  -p 'Pa$$w0rd!'

./kcadm.sh create components \
  -r master \
  -s name='my-client' \
  -s providerId=java-keystore \
  -s providerType=org.keycloak.keys.KeyProvider \
  -s parentId=master \
  -s 'config.priority=["101"]' \
  -s 'config.enabled=["true"]' \
  -s 'config.active=["true"]' \
  -s 'config.keystore=['\"${KEYSTORE}\"']' \
  -s 'config.keystorePassword=['\"${KEYSTORE_STORE_PASSWORD}\"']' \
  -s 'config.keyPassword=['\"${KEYSTORE_KEY_PASSWORD}\"']' \
  -s 'config.keyAlias=['\"${KEYSTORE_ALIAS}\"']'

./kcadm.sh create components \
  -r master \
  -s name=uid-attribute-to-email-mapper \
  -s providerId=user-attribute-ldap-mapper \
  -s providerType=org.keycloak.storage.ldap.mappers.LDAPStorageMapper \
  -s parentId=johndoe \
  -s 'config."user.model.attribute"=["email"]' \
  -s 'config."ldap.attribute"=["uid"]' \
  -s 'config."read.only"=["false"]' \
  -s 'config."always.read.value.from.ldap"=["false"]' \
  -s 'config."is.mandatory.in.ldap"=["false"]'
