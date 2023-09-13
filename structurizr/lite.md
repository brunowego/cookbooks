# Structurizr Lite

## Links

- [Code Repository](https://github.com/structurizr/lite)

## WAR

### Installation

```sh
curl \
  -L "https://github.com/structurizr/lite/releases/download/$(curl -s https://api.github.com/repos/structurizr/lite/releases/latest | grep tag_name | cut -d '"' -f 4)/structurizr-lite.war" \
  -o ./structurizr-lite.war
```

### Usage

```sh
#
java -Djdk.util.jar.enableMultiRelease=false -jar ./structurizr-lite.war ./

echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Issues

#### Unsupported Class Version Error

```log
Error: LinkageError occurred while loading main class org.springframework.boot.loader.WarLauncher java.lang.UnsupportedClassVersionError: org/springframework/boot/loader/WarLauncher has been compiled by a more recent version of the Java Runtime (class file version 61.0), this version of the Java Runtime only recognizes class file versions up to 59.0
```

```sh
#
java --version

# Works with openjdk@1.17.0
```

#### TBD

```log
java.util.concurrent.ExecutionException: org.apache.catalina.LifecycleException: Failed to start component [StandardEngine[Tomcat].StandardHost[localhost].TomcatEmbeddedContext[]]
```

TODO

## Docker

### Running

```sh
#
export STRUCTURIZR_WORKSPACE_FILENAME='workspace'

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h structurizr \
  -v "$PWD":/usr/local/structurizr \
  -e STRUCTURIZR_WORKSPACE_FILENAME="$STRUCTURIZR_WORKSPACE_FILENAME" \
  -p 8080:8080 \
  --name structurizr \
  docker.io/structurizr/lite:latest
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f structurizr
```
