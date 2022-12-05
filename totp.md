# Time-Based One-Time Password (TOTP) (RFC 6238)

## Algorithms

- Hash-based Message Authentication Code (HMAC)
- HMAC-based One-time Password (HOTP) (RFC 4226)

## Scheme

```txt
otpauth://totp/<issuer>:<user>?secret=<secret>&issuer=<issuer>
```

## Library

- [PHP](https://github.com/Spomky-Labs/otphp)
- [Node.js](https://github.com/yeojz/otplib)

<!--
https://github.com/susam/mintotp
https://www.linotp.org/
-->

## Tools

- [FreeOTP](https://freeotp.github.io/)
