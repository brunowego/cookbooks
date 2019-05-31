# Images

## List Images

```sh
docker images -q
```

## Remove

```sh
docker rmi [image]
```

### Remove All Images

```sh
docker rmi $(docker images -q)
```

#### Filter

```sh
docker rmi $(docker images -q --no-trunc --filter "dangling=true")
```

### Remove Untagged Images

```sh
docker rmi $(docker images | grep 'none' | awk '/ / { print $3 }')
```
