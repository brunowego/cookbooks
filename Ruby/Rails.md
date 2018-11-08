# Rails

## Secret

```sh
rails secret
```

## Rbenv

```sh
vim .rbenv-vars

SECRET_KEY_BASE=
[APPNAME]_DATABASE_PASSWORD=

rbenv vars
```

## PostgreSQL

```sh
sudo vim /etc/postgresql/9.5/main/pg_hba.conf

local	all		[appname]				md5

sudo systemctl restart postgresql
```

### Setup

```sh
RAILS_ENV=production rails db:setup
```

### Console

```sh
RAILS_ENV=production rails console
```
