# GitLab

## URL

```sh
sudo vim /etc/gitlab/gitlab.rb
```

```rb
external_url "http://gitlab.domain.com/"
```

```sh
sudo gitlab-ctl reconfigure
```

## HTTPS

```sh
sudo vim /etc/gitlab/gitlab.rb
```

```rb
nginx['redirect_http_to_https'] = true
nginx['ssl_certificate'] = "/etc/gitlab/ssl/gitlab.crt"
nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/gitlab.key"
```

```sh
sudo mkdir -p /etc/gitlab/ssl
sudo chmod 700 /etc/gitlab/ssl
```

```sh
sudo openssl genrsa -out "/etc/gitlab/ssl/gitlab.key" 2048
sudo openssl req -new -key "/etc/gitlab/ssl/gitlab.key" -out "/etc/gitlab/ssl/gitlab.csr"
```

```txt
Country Name: BR
State or Province Name: Distrito Federal
Locality Name: Brasilia
Organization Name: Domain
Organizational Unit Name: Domain Team
Common Name: gitlab.domain.com
Email Address: username@domain.com
```

```sh
sudo openssl x509 -req -days 365 -in "/etc/gitlab/ssl/gitlab.csr" -signkey "/etc/gitlab/ssl/gitlab.key" -out "/etc/gitlab/ssl/gitlab.crt"
```

```sh
sudo gitlab-ctl reconfigure
sudo gitlab-ctl restart
```

## Mail

```sh
sudo vim /etc/gitlab/gitlab.rb
```

```rb
gitlab_rails['gitlab_email_from'] = "gitlab@domain.com"
gitlab_rails['gitlab_email_reply_to'] = "noreply@domain.com"
gitlab_rails['gitlab_support_email'] = "support@domain.com"

gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.mailgun.org"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_user_name'] = "postmaster@domain.com"
gitlab_rails['smtp_password'] = "secret"
gitlab_rails['smtp_domain'] = "domain.com"
```

```sh
sudo gitlab-ctl reconfigure
```

## Problems

```sh
sudo rm -r /srv/docker
```

## OmniAuth

```sh
sudo vim /etc/gitlab/gitlab.rb
```

```rb
gitlab_rails['omniauth_enabled'] = true
gitlab_rails['omniauth_allow_single_sign_on'] = false
gitlab_rails['block_auto_created_users'] = true
```

```sh
sudo gitlab-ctl reconfigure
```
