# Dockerfile

## Work directory

```Dockerfile
WORKDIR /usr/src/[app-name]
```

## APT

```Dockerfile
RUN apt update && \
    apt --no-install-recommends -y install [package]
```

## APK

```Dockerfile
RUN apk add --no-cache [package]
```

```Dockerfile
RUN apk add --virtual .build-deps [package]
RUN apk del --purge .build-deps
```

## Entrypoint

```Dockerfile
COPY ./docker-entrypoint.sh /sbin

ENTRYPOINT ["/sbin/docker-entrypoint.sh"]
```

## Build

```Dockerfile
FROM [repo]/[image]:[tag] as build

COPY --from=build [/path/to/file] [/path/to/destination]
```
