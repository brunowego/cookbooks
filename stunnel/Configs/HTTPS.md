# HTTPS

```sh
sudo mkdir -p /usr/local/etc/stunnel/conf.d
```

```sh
sudo tee /usr/local/etc/stunnel/conf.d/https.conf << EOF
[https]
client = yes
accept = 8443
connect = [hostname]:443
verify = 2
CAfile = /etc/ssl/certs/stunnel.pem
TIMEOUTclose = 300
TIMEOUTidle = 30
EOF
```

```sh
stunnel
```
