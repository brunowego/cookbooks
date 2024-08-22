# PostgreSQL

<!--
https://github.com/alibaba/PolarDB-for-PostgreSQL

pg_pool

https://github.com/postgres/postgres/blob/master/src/backend/utils/misc/postgresql.conf.sample
-->

## Links

- [Code Repositories](https://github.com/postgres/postgres)

## References

- [PostgreSQL Client](/postgresql/client.md)
- [PostgreSQL Server](/postgresql/server.md)

## Glossary

- Generalized Inverted Index (GIN)

## Managed

- [Supabase](/supabase/README.md)
- [Vercel Postgres](https://vercel.com/storage/postgres) 🌟

## Library

### Installation

#### Homebrew

```sh
brew install libpq
```

<!--
brew install postgresql
-->

#### APT

```sh
sudo apt update
sudo apt -y install libpq-dev
# g++ make
```

#### YUM

```sh
yum check-update
sudo yum -y install postgresql-devel
```

#### APK

```sh
sudo apk update
sudo apk add postgresql-dev
```

### Environment

#### Darwin

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# PostgreSQL Develop
export PATH="/usr/local/opt/libpq/bin:$PATH"
```

```sh
source ~/.zshrc
```

### Tips

#### Round price

```sql
UPDATE products SET price = ROUND(price::numeric, 2) WHERE price IS NOT NULL;
```

TODO

### Issues

#### TBD

```log
/bin/sh: pg_config: command not found
```

TODO
