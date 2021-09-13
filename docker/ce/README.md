# Docker Community Edition (CE)

<!--
https://docs.docker.com/develop/develop-images/build_enhancements/

Version v1.5.0 (2015/02)
Version v20.10.5
-->

<!--
Missing file
"${WAR_FILE:?You must especify the WAR_FILE variable in your .env file}:/usr/local/tomcat/webapps/openam.war"
-->

## References

- [Release Notes](https://docs.docker.com/engine/release-notes/)

## Tools

- [Lazydocker](/lazydocker.md)

## Dockerfile

### Tips

#### Build Kit

```sh
# CLI
DOCKER_BUILDKIT=0 docker build ./

# Daemon
TODO
# {"experimental":false,"features":{"buildkit":true},"insecure-registries":["[hostname]:5001","[hostname]:5001"]}%
```

#### Work directory

```Dockerfile
WORKDIR /usr/src/[app-name]
```

#### Output

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

#### Entrypoint

```Dockerfile
COPY ./docker-entrypoint.sh /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
```

#### Build

```Dockerfile
FROM [repo]/[image]:[tag] AS build

# ---

FROM [repo]/[image]:[tag]

COPY --from=build [/path/to/folder-or-file] [/path/to/destination]
```
