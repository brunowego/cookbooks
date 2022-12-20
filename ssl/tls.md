# Transport Layer Security (TLS)

## Tools

- [Test TLS](https://testtls.com)
- [CDN77 / TLS checker](https://cdn77.com/tls-test)

## Tips

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
