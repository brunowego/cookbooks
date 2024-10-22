# pg_dump

## Learn

- [How can we make pg_dump and pg_restore 5 times faster?](https://blog.peerdb.io/how-can-we-make-pgdump-and-pgrestore-5-times-faster)

## CLI

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

### Issues

#### TBD

```log
pg_dump: error: Dumping the contents of table "<table-name>" failed: PQgetResult() failed.
pg_dump: detail: Error message from server: ERROR:  canceling statement due to statement timeout
pg_dump: detail: Command was: COPY public.<table-name> (id, ...) TO stdout;
pg_dump: error: a worker process died unexpectedly
```

TODO
