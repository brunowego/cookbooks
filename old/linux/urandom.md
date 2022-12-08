# urandom

## CLI

### Usage

```sh
#
/bin/cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1
```
