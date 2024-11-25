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
- The Oversized-Attribute Storage Technique (TOAST)
- Write-Ahead Logs (WAL)

## Managed

- [Supabase](/supabase/README.md)
- [Vercel Postgres](https://vercel.com/storage/postgres) 🌟

## Library

### Installation

```sh
# Using Homebrew
brew install libpq
# brew install postgresql

# Using APT
sudo apt update
sudo apt -y install postgresql-client
# libpq-dev g++ make

# Using YUM
yum check-update
sudo yum -y install postgresql-devel

# Using APK
sudo apk update
sudo apk add postgresql-dev
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

#### Darwin

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
pg_restore: error: unsupported version (1.16) in file header
```

```sh
#
pg_restore --version

#
where pg_restore

# For MacOS (Darwin): Just install libpq
```

#### TBD

```log
/bin/sh: pg_config: command not found
```

TODO
