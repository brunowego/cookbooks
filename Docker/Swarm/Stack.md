# Stack

## Deploy

- [Reference](https://docs.docker.com/compose/compose-file/#deploy)

### Using compose

```sh
docker stack deploy --compose-file [name].yaml [name]
```

### Using bundle

```sh
docker stack deploy --bundle-file [name].dab [name]
```

## List

```sh
docker stack ls
```

## Process

```sh
docker stack ps [name]
```

## Remove

```sh
docker stack rm [name]
```

## Services

```sh
docker stack services [name]
```
