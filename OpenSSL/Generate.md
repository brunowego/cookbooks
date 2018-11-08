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
