# Inspect

## IP Address

```sh
docker inspect --format '{{json .NetworkSettings.Networks}}' [container]
```

### All

```sh
docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
```
