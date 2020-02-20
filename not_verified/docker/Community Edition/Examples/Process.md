# Process

## List

```sh
docker ps
```

### Quit

```sh
docker ps -q
```

### Format

```sh
docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'
```

```sh
jq '."psFormat" |= "table {{.ID}}\\t{{.Image}}\\t{{.Status}}\\t{{.Ports}}\\t{{.Names}}"' ~/.docker/config.json | sponge ~/.docker/config.json
```
