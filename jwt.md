# JSON Web Token (JWT)

<!--
https://youtube.com/watch?v=zYi9PguVFx8

http://jwtbuilder.jamiekurtz.com
https://javainuse.com/jwtgenerator
-->

## Links

- [Main Website](https://jwt.io/)
- [Encode or Decode JWTs](https://jsonwebtoken.io/)
- [JWT Authentication](https://roadmap.sh/guides/jwt-authentication)

## Learn

- [Estratégias de autenticação entre front-end e back-end com JWT (cookies storage)](https://youtube.com/watch?v=YcH2kxqK3nc)

## Store

<!--
SameSite=strict
-->

- Cookie: HttpOnly & Signed
- LocalStorage or SessionStorage: Vulnarable to XSS attack
- Memory: Not persistent

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

<!--
JWT_SECRET_KEY=S3cr3t_K@Key
-->
