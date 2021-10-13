# Let's Encrypt

<!--
https://letsencrypt.org/certificates/
https://letsencrypt.org/docs/dst-root-ca-x3-expiration-september-2021/
https://scotthelme.co.uk/lets-encrypt-old-root-expiration/
https://medium.com/geekculture/will-you-be-impacted-by-letsencrypt-dst-root-ca-x3-expiration-d54a018df257
-->

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

### Examples

####

```sh
sudo certbot --apache --renew-by-default -d datalayer.io
```

```sh
sudo certbot certonly --apache -d datalayer.io
```

```sh
sudo certbot renew --apache
```

```sh
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

0 */12 * * * root certbot -q renew --apache
```

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
