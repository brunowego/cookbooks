# Teleport Okta Single Sign-On Connector

## Create OAuth App

TODO

## Configuration

TODO

<!--
kind: saml
version: v2
metadata:
  name: okta
spec:
  acs: https://tele.domain.tld/v1/webapi/saml/acs
  attributes_to_roles:
  - {name: "groups", value: "okta-admin", roles: ["access"]}
  entity_descriptor: |
    <?xml !!! Make sure to shift all lines in XML descriptor
    with 4 spaces, otherwise things will not work
-->
