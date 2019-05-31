# Service

## Create

```sh
docker service create \
  --name [name] \
  --replicas 1 \
  -p [port]:[port] \
  [image]
```

## Inspect

```sh
docker service inspect --pretty [name]
```

## Logs

```sh
docker service logs [name]
```

## List

```sh
docker service ls
```

## Process

```sh
docker service ps [name]
```

## Remove

```sh
docker service rm [name]
```

## Rollback

```sh
docker service rollback [name]
```

## Scale

```sh
docker service scale [name]=[number]
```

## Update

```sh
docker service update --update-delay 5s [name]
```
