# Exec

## Run Commnad

```sh
docker exec -i [container] ls /
```

### As root

```sh
docker exec -itu root [container] whoami
```

## Pseudo-TTY

```sh
docker exec -it [container] /bin/bash
```
