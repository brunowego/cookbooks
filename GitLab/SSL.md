# SSL

```sh
sudo apt update
sudo apt install letsencrypt
```

```sh
sudo mkdir -p /var/www/letsencrypt
```

```sh
sudo vim /etc/gitlab/gitlab.rb

nginx['custom_gitlab_server_config'] = "location ^~ /.well-known { root /var/www/letsencrypt; }"
```

```sh
sudo gitlab-ctl reconfigure
```

```sh
sudo letsencrypt certonly -a webroot -w /var/www/letsencrypt -d [domain]
sudo ls /etc/letsencrypt/live/[domain]
```

```sh
sudo vim /etc/gitlab/gitlab.rb

external_url 'https://[domain]'

nginx['redirect_http_to_https'] = true

nginx['ssl_certificate'] = "/etc/letsencrypt/live/[domain]/fullchain.pem"
nginx['ssl_certificate_key'] = "/etc/letsencrypt/live/[domain]/privkey.pem"
```

```sh
sudo gitlab-ctl reconfigure
```

## Auto-Renewal

```sh
sudo crontab -e

0 */12 * * * /usr/bin/letsencrypt renew >> /var/log/le-renew.log
5 */12 * * * /usr/bin/gitlab-ctl restart nginx
```
