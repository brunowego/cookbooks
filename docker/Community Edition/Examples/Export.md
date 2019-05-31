# Export

## Image

### Save

```sh
docker save [image[:tag]] --output [name]
```

#### All

```sh
docker save $(docker images | sed '1d' | awk '{print $1 ":" $2 }') --output [name]
```

### Load

```sh
docker load --input [name]
```
