# Gitlab

Use this installation with [Dokku Alternative](https://github.com/dokku-alt/dokku-alt).

## Installation

```sh
git clone https://github.com/sameersbn/docker-gitlab.git gitlab
cd gitlab
git remote add dokku dokku@example.com:gitlab
git push dokku master
```

## Configuration

### PostgreSQL:

```sh
dokku postgresql:create gitlabhq_production
dokku postgresql:link gitlab gitlabhq_production
```

```sh
dokku postgresql:info gitlab gitlabhq_production
```

```sh
dokku config:set gitlab DB_TYPE=postgres \
DB_HOST=postgresql \
DB_NAME=gitlabhq_production \
DB_USER=gitlab \
DB_PASS= # Get the password using `dokku postgresql:info gitlab gitlabhq_production` command.
```

### Redis:

```sh
dokku redis:create gitlab
```

```sh
dokku redis:info gitlab
```

```sh
dokku config:set gitlab REDIS_HOST=redis \
REDIS_PORT=6379
```

### GitLab

```sh
dokku config:set gitlab GITLAB_PORT=80 \
GITLAB_SSH_PORT=22 \
GITLAB_HOST=gitlab \
GITLAB_EMAIL=gitlab@example.com \
GITLAB_SUPPORT=support@example.com
```

### SMTP

```smtp
dokku config:set gitlab SMTP_DOMAIN=www.gmail.com \
SMTP_HOST=smtp.gmail.com \
SMTP_PORT=587 \
SMTP_USER=username \
SMTP_PASS=password
```

### Bind Port

```sh
sudo git clone https://github.com/stuartpb/dokku-bind-port.git /var/lib/dokku-alt/plugins/bind-port
```

#### Secure Shell

For SSH-based git, we will need to expose the port `10022`:

```sh
dokku bind:create gitlab 10022
```

### Volumes

```sh
dokku volume:create gitlab /home/gitlab/data
dokku volume:link gitlab gitlab
```

### Show Configuration

```sh
dokku config gitlab
```

## Login

Open `gitlab.example.com`:

```md
User: root
Password: 5iveL!fe
```

## Problems

### Upload Size

```log
error: RPC failed; result=22, HTTP code = 413
fatal: The remote end hung up unexpectedly
```

```sh
dokku config:set gitlab NGINX_MAX_UPLOAD_SIZE=1g
```

```sh
sudo mkdir -p /home/dokku/gitlab/nginx.conf.d
```

```sh
cat << EOF | sudo tee -a /home/dokku/gitlab/nginx.conf.d/upload.conf
client_max_body_size 1G;
EOF
```

```sh
sudo chown dokku:dokku /home/dokku/gitlab/nginx.conf.d/upload.conf
```

```sh
sudo systemctl restart nginx
```
