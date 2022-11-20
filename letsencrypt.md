# Let's Encrypt (LE)

## Links

- [Main Website](https://letsencrypt.org)
- [Chain of Trust](https://letsencrypt.org/certificates/)

## Docs

- [Glossary](https://letsencrypt.org/docs/glossary/)
- [ACME Client Implementations](https://letsencrypt.org/docs/client-options/)
- [DST Root CA X3 Expiration (September 2021)](https://letsencrypt.org/docs/dst-root-ca-x3-expiration-september-2021/)

## Issues

- [Prevent public key changin when renewing SSL certs](https://community.letsencrypt.org/t/prevent-public-key-changin-when-renewing-ssl-certs/25489/2)

## Tools

- [cert-manager](/cert-manager/README.md)
- [Let's Encrypt R3 verification](https://verify-letsencryptr3.dnsimple.tools/)

## Glossary

- Electronic Frontier Foundation (EFF)

## ACME Client Implementations

- [Certbot](/certbot/README.md) 🌟
- [getssl](/getssl.md)
- [Lego](/lego.md)

## Tips

### Cleanup Expired Let's Encrypt CA

```sh
# Debian/Ubuntu
openssl x509 \
  -in /usr/share/ca-certificates/mozilla/DST_Root_CA_X3.crt \
  -noout \
  -text
```

```Dockerfile
# Cleanup expired Let's Encrypt CA (Sept 30, 2021)
RUN sed -i '/^mozilla\/DST_Root_CA_X3/s/^/!/' /etc/ca-certificates.conf && update-ca-certificates -f
```
