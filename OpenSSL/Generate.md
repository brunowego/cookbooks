# Generate

## Self-signed SSL Certificate

```sh
openssl req \
  -out /etc/ssl/certs/example-selfsigned.crt \
  -nodes \
  -keyout /etc/ssl/private/example-selfsigned.key \
  -newkey rsa:4096 \
  -subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=OrgName/OU=IT Department/CN=example.com" \
  -x509 \
  -sha256 \
  -days 365
```

##

```sh
# Generate a new private key and Certificate Signing Request.
openssl req -out csr.csr -new -newkey rsa:2048 -nodes -keyout key.key -subj "/C=BE/ST=Brussels Area/L=Brussles/O=Datalayer/OU=Data Analytics/CN=local.whoami.datalayer.io"
# Generate a self-signed certificate.
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.crt -subj "/C=BE/ST=Brussels Area/L=Brussles/O=Datalayer/OU=Data Analytics/CN=local.whoami.datalayer.io"
# Generate a certificate signing request (CSR) for an existing private key.
openssl req -out CSR.csr -key privateKey.key -new
# Generate a certificate signing request based on an existing certificate.
openssl x509 -x509toreq -in certificate.crt -out CSR.csr -signkey privateKey.key
# Remove a passphrase from a private key.
openssl rsa -in privateKey.pem -out newPrivateKey.pem
```
