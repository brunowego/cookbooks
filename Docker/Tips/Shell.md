# Shell

## EOF

```sh
docker exec -i [container] /bin/sh << 'EOSHELL'
[script]
EOSHELL
```

###

```sh
docker exec -i [container] /bin/sh -c "$(cat << EOSHELL
[script]
EOSHELL
)"
```
