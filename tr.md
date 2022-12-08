# Translate Characters (tr)

## CLI

### Issues

#### Missing LC_CTYPE

```log
tr: Illegal byte sequence
```

```sh
#
/bin/cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1

#
LC_CTYPE=C tr -dc A-Za-z0-9 < /dev/urandom | head -c 32
```
