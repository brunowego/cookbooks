# Open Authorization (OAuth)

<!--
https://app.pluralsight.com/library/courses/oauth2-json-web-tokens-openid-connect-introduction/table-of-contents?aid=7010a000002BWqBAAW

https://app.pluralsight.com/library/courses/oauth-2-getting-started/table-of-contents

https://roadmap.sh/guides/oauth
-->

## Links

- [Main Website](https://oauth.net/)
- [Main Website - Code](https://oauth.net/code/)
- [Web Authorization Protocol (OAuth)](https://datatracker.ietf.org/wg/oauth/documents/)

## Specs

- [RFC6749](https://datatracker.ietf.org/doc/html/rfc6749)
- [RFC6750](https://datatracker.ietf.org/doc/html/rfc6750)

## OAuth2 Flows

### With User Interaction

- Authorization Code Flow: Web application clients
  1. Request authorization (Consent)
  2. Request token
  3. Access resource
- Implicit Flow: Native/local clients
  1. Request authorization & token
  2. Access resource

### Without User Interaction

- Resource Owner Password Credential Flow: "Trusted clients""
  1. Request token with resource owner credentials
  2. Access resource
- Client Credential Flow: Client to service communication
  1. Request token with client credentials
  2. Access resource

## OAuth2 & Authentication

- OAuth2 is for (delegated) authorization
  - Authentication is a pre-requisite for that.
  - Access tolem os for some back-end service
- Sometimes you "just" need authentication
  - (at least to begin with)
  - Identify user in an application
  - Control access to application features
- OAuth2 is regularly "abused" for that
