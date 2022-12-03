# ChopChop

**Keywords:** Endpoint Scanning

## Links

- [Code Repository](https://github.com/michelin/ChopChop)

## Docker

### Running

```sh
#
docker run -it --rm \
  ghcr.io/michelin/gochopchop -h

#
export DOMAIN='<domain>'

docker run -it --rm \
  ghcr.io/michelin/gochopchop scan "$DOMAIN" -v debug -k
```
