# Shell

## EOF

```sh
docker exec -i [container] /bin/sh << 'EOSHELL'

EOSHELL
```

###

```sh
docker exec -i [container] /bin/sh -c "$(cat << EOSHELL

EOSHELL
)"
```
