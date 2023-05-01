# Docker Community Edition (CE)

**Keywords:** Container Runtime

<!--
https://docs.docker.com/develop/develop-images/build_enhancements/

Version v1.5.0 (2015/02)
Version v20.10.5
-->

<!--
2 CPU
4GB Memory
-->

<!--
Missing file
"${WAR_FILE:?You must especify the WAR_FILE variable in your .env file}:/usr/local/tomcat/webapps/openam.war"
-->

## References

- [Release Notes](https://docs.docker.com/engine/release-notes/)

## Tools

- [Lazydocker](/lazydocker.md)

## App

### Tips

#### Memory Monitoring (macOS)

1. Open Activity Monitor -> Add column "Real Memory"
2. Filter by: `com.docker`

## Dockerfile

### Tips

#### Work directory

```Dockerfile
WORKDIR /usr/src/<app-name>
```

#### Output

```Dockerfile
RUN echo '\
<text>\
' > </path/to/file>
```

```Dockerfile
RUN echo '\
<text>\
' | tee </path/to/file>
```

```Dockerfile
RUN { \
      echo '<text>'; \
      echo '<text>'; \
      echo '<text>'; \
    } > </path/to/file>
```

#### Entrypoint

```Dockerfile
COPY ./docker-entrypoint.sh /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
```

#### Build

```Dockerfile
FROM <repo>/<image>:<tag> AS build

# ---

FROM <repo>/<image>:<tag>

COPY --from=build </path/to/folder-or-file> </path/to/destination>
```
