# Dockerfile

## Work directory

```Dockerfile
WORKDIR /usr/src/[app-name]
```

## Output

```Dockerfile
RUN echo '\
[text]\
' > [/path/to/file]
```

```Dockerfile
RUN echo '\
[text]\
' | tee [/path/to/file]
```

```Dockerfile
RUN { \
      echo '[text]'; \
      echo '[text]'; \
      echo '[text]'; \
    } > [/path/to/file]
```

## Entrypoint

```Dockerfile
COPY ./docker-entrypoint.sh /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
```

## Build

```Dockerfile
FROM [repo]/[image]:[tag] AS build

FROM [repo]/[image]:[tag]

COPY --from=build [/path/to/folder-or-file] [/path/to/destination]
```
