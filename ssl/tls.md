# Transport Layer Security (TLS)

## Glossary

- Online Certificate Status Protocol (OCSP)

## Tools

- [Test TLS](https://testtls.com)
- [CDN77 / TLS checker](https://cdn77.com/tls-test)

## Backends

- [GnuTLS](https://gnutls.org)
- [Network Security Services (NSS)](./)
- [OpenSSL](/openssl.md)

## Tips

### OCSP Stapling

```sh
#
curl --cert-status https://example.com
```

<!-- ### TLS Versions

https://everything.curl.dev/usingcurl/tls/versions -->

<!-- ### TLS Auth

https://everything.curl.dev/usingcurl/tls/auth -->

### Ciphers Versions

```sh
#
export DOMAIN='www.google.com'

#
openssl s_client -connect "$DOMAIN":443 -tls1_2
openssl s_client -connect "$DOMAIN":443 -tls1_1
openssl s_client -connect "$DOMAIN":443 -tls1

#
nmap --script ssl-enum-ciphers -p 443 "$DOMAIN"
```
