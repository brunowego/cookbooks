# Let's Encrypt (LE)

<!--
https://letsencrypt.org/certificates/
https://letsencrypt.org/docs/dst-root-ca-x3-expiration-september-2021/
https://scotthelme.co.uk/lets-encrypt-old-root-expiration/
https://medium.com/geekculture/will-you-be-impacted-by-letsencrypt-dst-root-ca-x3-expiration-d54a018df257

Let’s Encrypt show email status usage
-->

## Links

- [Main Website](https://letsencrypt.org)

## Docs

- [Glossary](https://letsencrypt.org/docs/glossary/)

## Tools

- [cert-manager](/cert-manager/README.md)
- [Let's Encrypt R3 verification](https://verify-letsencryptr3.dnsimple.tools/)

## CLI

### Installation

#### Homebrew

```sh
brew install letsencrypt
```

#### APT

```sh
sudo apt update
sudo apt -y install python-certbot-apache
```

#### Commands

```sh
certbot -h
```

### Usage

```sh
#
sudo certbot \
  --apache \
  --renew-by-default \
  -d datalayer.io

#
sudo certbot certonly \
  --apache \
  -d datalayer.io

#
sudo certbot renew --apache
```

<!--
certbot certonly \
  --dry-run \
  -n \
  --dns-route53 \
  --agree-tos \
  --csr "<path to my CSR>" \
  --register-unsafely-without-email \
  --no-eff-email \
  --dns-route53-propagation-seconds 300 \
  --cert-path "<path to store the issued X.509 Leaf Certificate>" \
  --key-path "<path to store the private key>" \
  --fullchain-path "<path to store the issued X.509 Leaf Certificate and the chain of intermediate and CA Certificates as a bundle>" \
  --chain-path "<path to store the chain of intermediate and CA Certificates as a bundle minus the actual issued X.509 Leaf Certificate>" \
  -d sub.domain.tld

certbot certonly \
  --- same as above ---
  --duplicate \
  --force-renewal \
  -d sub.domain.tld
-->

<!-- ```sh
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

0 */12 * * * root certbot -q renew --apache
``` -->

<!--
sudo certbot renew --force-renew --preferred-chain "DST Root CA X3"
15 0 * * * /usr/bin/certbot renew --preferred-chain "DST Root CA X3"
-->

### Tips

#### Cleanup Expired Let's Encrypt CA

##### Debian/Ubuntu

```sh
openssl x509 \
  -in /usr/share/ca-certificates/mozilla/DST_Root_CA_X3.crt \
  -noout \
  -text
```

```Dockerfile
# Cleanup expired Let's Encrypt CA (Sept 30, 2021)
RUN sed -i '/^mozilla\/DST_Root_CA_X3/s/^/!/' /etc/ca-certificates.conf && update-ca-certificates -f
```

#### CA Signed Certificate

```sh
keytool -certreq -alias datalayer -keystore datalayer.jks -file datalayer.csr
```

#### Self-Signed Certificate

```sh
keytool -keystore datalayer.jks -alias datalayer -genkey -keyalg RSA -sigalg SHA256withRSA -validity 365
```

```sh
keytool -keystore keystore -alias doc-api -genkey -keyalg RSA
keytool -keystore keystore -alias doc-api -genkey -keyalg RSA -sigalg SHA256withRSA
keytool -keystore keystore -alias doc-api -genkey -keyalg RSA -sigalg SHA256withRSA -ext 'SAN=dns:doc.datalayer.io,dns:*.datalayer.io'
```

#### Load Certificate

```sh
keytool -keystore datalayer.jks -import -alias datalayer -file certificate.crt -trustcacerts
```

<!-- #### Caddy Configuration

```sh
# Homebrew
cat << EOF > /usr/local/etc/Caddyfile
:80 {
  root /var/www/html

  fastcgi / 127.0.0.1:9000 php {
    index index.php
  }

  gzip

  tls admin@example.com
}
EOF
```

```sh
# Homebrew
brew services restart caddy
``` -->
