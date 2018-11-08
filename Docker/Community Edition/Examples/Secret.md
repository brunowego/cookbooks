# Secret

## Create

```sh
docker secret create [name] [file|-]
```

### With static

```sh
echo 'Pa$$w0rd!' | docker secret create [name] -
```

### With generator

```sh
openssl rand -base64 20 | docker secret create [name] [file|-]
```

## Inspect

```sh
docker secret inspect [name]
```

## List

```sh
docker secret ls
```

## Remove

```sh
docker secret rm [name]
```
