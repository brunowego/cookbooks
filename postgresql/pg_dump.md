# pg_dump

## Learn

- [How can we make pg_dump and pg_restore 5 times faster?](https://blog.peerdb.io/how-can-we-make-pgdump-and-pgrestore-5-times-faster)

## CLI

### Installation

Follow the [instructions here](./README.md#installation).

### Commands

```sh
pg_dump --help
```

### Usage

```sh
#
pg_dump \
  -h 127.0.0.1 \
  -p 5432 \
  -U <username> \
  -t 'public.products' \
  --schema-only \
  <db-name> \
  > ./dump.sql
```

### Tips

#### Dump Large Databases

```sh
#
export DATABASE_URL=postgres://acme:acme@localhost:5432/acme

# Compressed
pg_dump \
  -f ./dump-$(date -u '+%Y.%m.%d-%H%M').backup \
  -Fc \
  "$DATABASE_URL"

file --mime-type ./dump-*.backup
```

<!--
# Parallel Dump
pg_dump \
  -f ./dump-$(date -u '+%Y.%m.%d-%H%M') \
  -Fd \
  -j 8 \
  "$DATABASE_URL"
-->

##### TBD

<!--
pg_dump --no-owner --no-acl --schema public -Fc -v --table public.users --dbname "$STAGING_DATABASE_URL" > ./users.dump
pg_dump --no-owner --no-acl --schema public -v --table public.users --dbname "$STAGING_DATABASE_URL" > ./users.sql

pg_restore --list ./users.dump

pg_restore -f ./staging.sql -x -O --section=pre-data ./staging.dump
pg_restore -f ./staging-data.sql -x -O --section=data ./staging.dump

echo 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp" SCHEMA public;' > ./schema.sql
cat ./staging.sql >> ./schema.sql

wc -l ./users.sql

sed 's/extensions.uuid_generate_v4()/public.uuid_generate_v4()/g' ./schema.sql > ./schema_fixed.sql

psql "$LOCAL_DATABASE_URL" -f ./schema_fixed.sql
psql "$LOCAL_DATABASE_URL" -f ./staging-data.sql

pg_restore --no-owner --no-acl -d "$LOCAL_DATABASE_URL" -v ./users.dump
pg_restore --no-owner --no-acl -d "$LOCAL_DATABASE_URL" -v --disable-triggers ./users.dump

pg_restore --verbose --clean --create --no-owner --no-acl --dbname "$LOCAL_DATABASE_URL" ./users.dump
-->

```sh
#
pg_dump --no-owner --no-acl --schema public -Fc -v --exclude-table public.block_attributes --dbname "$STAGING_DATABASE_URL" > ./staging.dump

pg_restore --list ./staging.dump

pg_dump --no-owner --no-acl --schema public -Fc -v --table public.block_attributes --dbname "$STAGING_DATABASE_URL" > ./block_attributes.dump

pg_restore --list ./block_attributes.dump

#
pg_restore --verbose --clean --no-owner --no-acl --dbname "$LOCAL_DATABASE_URL" --schema public ./staging.dump

pg_restore --verbose --no-owner --no-acl --dbname "$LOCAL_DATABASE_URL" --schema public ./block_attributes.dump
```

### Issues

#### TBD

```log
pg_dump: error: Dumping the contents of table "<table-name>" failed: PQgetResult() failed.
pg_dump: detail: Error message from server: ERROR:  canceling statement due to statement timeout
pg_dump: detail: Command was: COPY public.<table-name> (id, ...) TO stdout;
pg_dump: error: a worker process died unexpectedly
```

TODO

## Docker

### Running

```sh
#
docker run -it --rm \
  -h pg_dump \
  --name pg_dump \
  --entrypoint /usr/local/bin/pg_dump \
  docker.io/library/postgres:11.2-alpine --help
```

### Tips

#### Dump

```sh
#
export DATABASE_URL=postgres://acme:acme@localhost:5432/acme

#
docker run -it --rm \
  -h pg_dump \
  --name pg_dump \
  -e DATABASE_URL="$DATABASE_URL" \
  -v $(pwd)/backup:/backup \
  --entrypoint /usr/local/bin/pg_dump \
  docker.io/library/postgres:17.0-alpine \
    -f ./backup/dump-$(date -u '+%Y.%m.%d-%H%M').backup \
    -Fc \
    "$DATABASE_URL"
```
