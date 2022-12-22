# Shell

## EOF

```sh
docker exec -i [container] /bin/sh << 'EOSHELL'

EOSHELL
```

### TBD

```sh
docker exec -i [container] /bin/sh -c "$(cat << EOSHELL

EOSHELL
)"
```
