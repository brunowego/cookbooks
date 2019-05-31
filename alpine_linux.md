# Alpine Linux

## Docker

### Running

```sh
docker run -it --rm \
  -h alpine \
  --name alpine \
  alpine:3.9 /bin/sh
```

## Tips

### Bash instead native shell

```sh
apk update
apk add --no-cache bash shadow
```

```sh
chsh -s `which bash`
```

```sh
exec `which bash`
```
