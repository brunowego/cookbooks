# JSON Web Token (JWT)

<!--
https://www.youtube.com/watch?v=zYi9PguVFx8
-->

## Links

- [Main Website](https://jwt.io/)
- [Encode or Decode JWTs](https://jsonwebtoken.io/)
- [JWT Authentication](https://roadmap.sh/guides/jwt-authentication)

<!--
- SAML 1.1/2.0
  - XML based
  - Many encryption & signature options
  - Very expressive
- Simple Web Token (SWT)
  - Form/URL encoded
  - Symmetric signatures only
- JSON Web Token (JWT)
  - JSON encoded
  - Symmetric and asymmetric signatures (HMACSHA256-384, ECDSA, RSA)
  - Symmetric and asymmetric encryption (RSA, AES/CGM)
  - (The new standard)
-->

<!--
Issuer (iss)
Subject (sub)
Audience (aud)
Expiration (exp)
-->

<!--
Header

{
  "typ": "JWT",
  "alg": "HS256"
}

Claims

{
  "iss": "http://myissuer",
  "exp": "1340819380",
  "aud": "http://myresource",
  "sub": "john",

  "client": "xyz",
  "scope": ["read", "search"],
}

Signature

{

}
-->
