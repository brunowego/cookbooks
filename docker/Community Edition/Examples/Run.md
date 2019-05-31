# Run

## Start

```sh
docker run -it --rm [image] /bin/bash
```

### Entrypoint

```sh
docker run -it --rm --entrypoint /bin/sh [image]
```

### Port

```sh
docker run -it --rm -p [port] [image] /bin/bash
```

### Network

```sh
docker run -it --rm --network [param] [image] /bin/bash
```

> Network params: `default`, `bridge`, `host` and `none`

### Detach

```sh
docker run -d --rm [image] /bin/bash
```
