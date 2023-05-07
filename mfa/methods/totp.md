# Time-Based One-Time Password (TOTP) (RFC 6238)

**Keywords:** OTP

## Algorithms

- Hash-based Message Authentication Code (HMAC)
- HMAC-based One-time Password (HOTP) (RFC 4226)

## Scheme

```txt
otpauth://totp/<issuer>:<user>?secret=<secret>&issuer=<issuer>

otpauth://totp/<issuer>:<user>?secret=<secret>&period=30&digits=6&algorithm=SHA1&issuer=<issuer>
```
