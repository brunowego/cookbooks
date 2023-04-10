# OpenID Connect (OIDC)

<!--
cloudentity

https://docs.wso2.com/display/IS520/XACML+Performance+in+the+Identity+Server
https://www.netiq.com/documentation/access-manager-45/pdfdoc/performance-and-sizing-guidelines/performance-and-sizing-guidelines.pdf

Impersonated
-->

<!--
Client

https://github.com/AxaGuilDEv/react-oidc
-->

**Keywords:** Identity Provider (IdP)

## Links

- [Main Website](https://openid.net/connect/)
- [Certified OpenID Connect Implementations](https://openid.net/developers/certified/)
- [Wikipedia](https://en.wikipedia.org/wiki/OpenID)

## Debugger

- [OpenID Connect \<debugger/\>](https://oidcdebugger.com)
- [OpenID Connect Playground](https://openidconnect.net) 🌟

<!--
https://developers.onelogin.com/blog/openidconnect-inspector
https://developers.onelogin.com/openid-connect/inspector

https://medium.com/application-security/openid-connect-tester-for-developers-63427324faea
-->

## Providers

- [Dex](/dex/README.md)
- [IdentityServer](/identityserver.md)
- [Keycloak](/keycloak/README.md)
- [Ory Hydra](/ory-hydra.md)

<!-- ##

- JWT Token
- OAuth2 specification describes accesses tokens
- OIDC adopts OAuth2 specification and add identity tokens to that -->

<!-- ##

- Client Id (+Secret)
- Scopes
- ResponseType
- Redirect URI -->

## OpenID Connect Flows

- OpenID Connect builds on top of OAuth2
  - Authorization Code Flow
  - Implicit Flow
- Adds some new concepts
  - ID Token
  - UserInfo endpoint
- ..and some additional protocols, e.g.
  - Discovery & dynamic registration
  - Session management

## OpenID Connect: The Players

- Identity Provider (IdP)
- Authorization Endpoint
- Token Endpoint
- UserInfo Endpoint

## Scopes & Claims

OpenID defines a set of standard scopes and claims:

| Scope          | Claims                                                                                                                                                    |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| profile        | name, family_name, given_name, middle_name, nickname, preferred_username, profile, picture, website, gender, birthdate, zoneinfo, locale, and updated_at. |
| email          | email, email_verified                                                                                                                                     |
| address        | address                                                                                                                                                   |
| phone          | phone_number, phone_number_verified                                                                                                                       |
| offline_access | requests refresh token                                                                                                                                    |
